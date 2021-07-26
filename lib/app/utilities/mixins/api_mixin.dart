import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getX;
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/services/cache_service.dart';
import 'package:majorica/generated/l10n.dart';

import '../app_util.dart';

mixin ApiMixin {
  final _dio = Dio();

  Future<Map<String, dynamic>> post(
    String url, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? header,
    int? sendTimeout,
    int? receiveTimeout,
    Function(int? count, int? total)? onSendProgress,
    Function(int? count, int? total)? onReceiveProgress,
  }) async {
    body.addAll(
      {
        "lang": AppUtil.isLtr ? "en" : "ar",
      },
    );
    print('Request body : $body');
    return request(
      _dio.post(
        url,
        data: json.encode(body),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: header,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? header,
    int? sendTimeout,
    int? receiveTimeout,
    Function(int? count, int? total)? onReceiveProgress,
  }) async {
    return request(
      _dio.get(
        url,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: header,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      ),
    );
  }

  Map<String, dynamic> filesToBase64(Map<String, File>? files) {
    Map<String, String>? allFilesAsBase64 = <String, String>{};
    if (files != null || files!.entries.isNotEmpty) {
      for (final entry in files.entries) {
        if (entry.value.path.length > 3) {
          final File file = File(entry.value.path);
          final List<int> fileInByte = file.readAsBytesSync();
          final String singleFileInBase64 = base64Encode(fileInByte);
          allFilesAsBase64[entry.key] = singleFileInBase64;
          print('Files in Base64 : $allFilesAsBase64');
        }
      }
    }
    return allFilesAsBase64;
  }

  Future<String> handleAPIError(APIError error) async {
    print('API error : ${error.message}');
    String errorMsg = '';
    switch (error.code) {
      case 600:
        errorMsg = S.current.unAuthorized;
        AuthService.to.currentUser(null);
        AuthService.to.sessionID(null);
        await CacheService.to.userRepo.clear();
        getX.Get.offAllNamed(Routes.ACCOUNT);
        break;
      default:
        errorMsg = error.message!;
    }
    return errorMsg;
  }

  Future<Map<String, dynamic>> request(
    Future<Response> future,
  ) async {
    try {
      final data = await future;
      final Map<String, dynamic> response =
          json.decode(data.toString()) as Map<String, dynamic>;
      print('Response : ${data.toString()}');
      if (response['error'] != null) {
        throw DioError(
          requestOptions: RequestOptions(
            path: '',
          ),
          type: DioErrorType.response,
          response: Response<APIError>(
            data: APIError(
              message: response['error'],
              code: response['errorCode'],
            ),
            statusCode: 400,
            requestOptions: RequestOptions(
              path: '',
            ),
          ),
        );
      } else {
        return response;
      }
    } on DioError catch (dioError) {
      String errorMessage = S.current.httpException;
      if (dioError.type == DioErrorType.connectTimeout ||
          dioError.type == DioErrorType.receiveTimeout ||
          dioError.type == DioErrorType.sendTimeout ||
          dioError.type == DioErrorType.other) {
        errorMessage = S.current.socketException;
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = S.current.httpException;
      } else if (dioError.type == DioErrorType.response) {
        switch (dioError.response!.statusCode) {
          case 401:
            errorMessage = S.current.unAuthorized;
            break;
          case 400:
            errorMessage = await handleAPIError(dioError.response!.data!);
            break;
          case 500:
            errorMessage = S.current.formatException;
            break;
          default:
            errorMessage = S.current.formatException;
        }
      }
      throw errorMessage;
    }
  }
}

class APIError {
  final String? message;
  final int? code;

  APIError({
    this.message,
    this.code,
  });
}
