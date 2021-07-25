import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/data/models/home_data.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../../payment_view.dart';

class HomeController extends GetxController with BusyMixin, ApiMixin {
  TextEditingController payAmount = TextEditingController();
  GlobalKey<FormState> payBalanceFormKey = GlobalKey<FormState>();
  final payAvailable = false.obs;
  final payBalanceLoading = false.obs;
  final range = Rx<DateTimeRange>(
    DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        const Duration(days: 1),
      ),
    ),
  );

  static HomeController get to => Get.find();
  final homeData = Rxn<HomeData>();

  Future<void> fetchHomeData() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.getHome,
        body: {
          "sessionID": sessionID,
        },
      );
      if (response['success'] == true) {
        homeData(HomeData.fromJson(response));
      }
      if (response['user'] != null) {
        payAvailable(response['user']!['payBalance'] ?? false);
      }
      endBusySuccess();
    } catch (error) {
      print('error fetching home date : $error');
    }
  }

  Future<void> requestService(
    String resID,
    String requestId,
    String requestInfo,
  ) async {
    try {
      startBusyWithId(requestId);
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.sendRequest,
        body: {
          "sessionID": sessionID,
          "resvID": resID,
          "type": "request",
          "requestID": int.tryParse(requestId),
        },
      );
      if (response['success'] == true) {
        await AppUtil.showAlertDialog(
          contentText: S.current.requestedService(requestInfo),
        );
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> requestDND(
    String resID, {
    bool currentDND = false,
  }) async {
    try {
      startBusyWithId('DND');
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.sendRequest,
        body: {
          "sessionID": sessionID,
          "resvID": resID,
          "type": "DND",
          "DNDValue": currentDND
        },
      );
      if (response['success'] == true) {
        homeData.update((val) {
          final int index = val!.myRooms!.indexWhere(
            (element) => element.iD == resID,
          );
          val.myRooms![index].dND = currentDND;
        });
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> payBalance() async {
    final formData = payBalanceFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        payBalanceLoading(true);
        if (int.tryParse(payAmount.text)! < 100) {
          payAmount.clear();
          Get.back();
          throw S.current.minPayBalance;
        } else {
          Get.back();
          final sessionID = AuthService.to.currentUser.value!.sessionID;
          final response = await post(
            ApiUtil.payBalance,
            body: {
              "sessionID": sessionID,
              "payAmount": payAmount.text,
            },
          );
          if (response['paymentToken'] != null) {
            payAmount.clear();
            final result = await Get.to(
              () => Payment(
                paymentToken: response['paymentToken'],
              ),
            );
            print('::::::::::::::::::::::::::::::: $result');
            if (result != null) {
              final message = json.decode(result);
              AppUtil.showAlertDialog(
                contentText: message['success'] == true
                    ? S.current.paymentDoneSuccessfully
                    : message['error'],
                confirmText: S.current.done,
              );
            }
            fetchHomeData();
          }
          payBalanceLoading(false);
        }
      } catch (error) {
        payBalanceLoading(false);
        endBusyError(error, showDialog: true);
      }
    }
  }
}
