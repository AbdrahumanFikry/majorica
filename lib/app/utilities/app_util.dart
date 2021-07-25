import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/loading.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

import 'color_util.dart';

class AppUtil {
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  static final RegExp phoneValidatorRegExp = RegExp(r'^\+?[0-9]{10,}$');
  static BorderRadius borderRadius0 = BorderRadius.circular(0);
  static BorderRadius borderRadius7 = BorderRadius.circular(7.5);
  static BorderRadius borderRadius10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadius25 = BorderRadius.circular(25.0);

  static OutlineInputBorder outLineInputBorder({
    Color? color,
    BorderRadius? borderRadius,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: color ?? Colors.transparent,
          width: 0.5,
        ),
      );

  static OutlineInputBorder errorOutLineInputBorder({
    BorderRadius? borderRadius,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: ColorUtil.errorColor,
          width: 0.5,
        ),
      );

  static UnderlineInputBorder underLineInputBorder({
    Color? color,
    BorderRadius? borderRadius,
  }) =>
      UnderlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: color ?? ColorUtil.mediumGrey,
        ),
      );

  static UnderlineInputBorder errorUnderLineInputBorder({
    BorderRadius? borderRadius,
  }) =>
      UnderlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: ColorUtil.errorColor,
        ),
      );

  static ThemeData appLightTheme = ThemeData(
    fontFamily: 'Cairo',
    primaryColor: ColorUtil.primaryColor,
    scaffoldBackgroundColor: ColorUtil.whiteScaffold,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static TextStyle textStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    Locale? locale,
    List<Shadow>? shadows,
    TextDecoration? decoration,
    String? fontFamily,
    double? height,
  }) {
    return TextStyle(
      color: color ?? ColorUtil.blackColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      locale: locale ?? currentLocale,
      decoration: decoration,
      shadows: shadows,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static bool get isLtr => intl.Intl.getCurrentLocale() == 'en';

  static Locale get currentLocale =>
      isLtr ? const Locale('en', 'US') : const Locale('ar', 'EG');

  static void showAlertSnack({
    String? title,
    String? body,
    bool isGood = false,
    void Function()? onTapSnack,
    Duration? duration,
    String? buttonText,
    void Function()? onTapButton,
    SnackPosition? snackPosition,
  }) {
    Get.snackbar(
      title ?? S.current.alert,
      body!,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 15.0),
      onTap: (_) => onTapSnack?.call(),
      duration: duration,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      backgroundColor: ColorUtil.lightGrey,
      titleText: Text(
        title ?? S.current.alert,
        style: TextStyle(
          color: isGood ? Colors.green : ColorUtil.errorColor,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      messageText: Text(
        body,
        style: const TextStyle(
          color: ColorUtil.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
      borderRadius: 15.0,
      mainButton: buttonText == null
          ? null
          : TextButton(
              onPressed: () => onTapSnack?.call(),
              style: TextButton.styleFrom(
                elevation: 3.0,
                backgroundColor: ColorUtil.darkBlue,
              ),
              child: Text(
                buttonText,
                style: textStyle(
                  color: ColorUtil.errorColor,
                ),
              ),
            ),
      isDismissible: false,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static Future<bool?> showAlertDialog({
    String? title,
    String? contentText,
    Function? onConfirm,
    String? confirmText,
    bool enableCancel = false,
    String? cancelText,
    RxBool? loading,
    Widget? child,
  }) async {
    return Get.dialog<bool>(
      AlertDialog(
        titlePadding: const EdgeInsets.symmetric(vertical: 5.0),
        contentPadding: EdgeInsets.zero,
        backgroundColor: ColorUtil.whiteScaffold,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius10,
        ),
        content: SingleChildScrollView(
          child: Column(
            textDirection:
                AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (enableCancel)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    splashRadius: 100.sp,
                    onPressed: () => Get.back(result: false),
                    icon: Icon(
                      CupertinoIcons.clear,
                      color: ColorUtil.errorColor,
                      size: 90.sp,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Text(
                  title ?? S.current.alert,
                  textAlign: TextAlign.center,
                  style: textStyle(
                    color: ColorUtil.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
              ),
              if (loading?.value != null && loading?.value == true)
                Loading()
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: child ??
                      Text(
                        contentText ?? '-',
                        style: const TextStyle(
                          color: ColorUtil.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        maxLines: 10,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              const SizedBox(
                height: 10.0,
              ),
              AppButton(
                elevation: 0.0,
                backgroundColor: ColorUtil.primaryColor,
                borderRadius: borderRadius10,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 30.0,
                ),
                title: confirmText ?? S.current.confirm,
                onTap: () {
                  if (onConfirm != null) {
                    onConfirm.call();
                  } else {
                    Get.back(result: true);
                  }
                },
              ),
            ],
          ),
        ),
        buttonPadding: EdgeInsets.zero,
      ),
    );
  }

  static Future<void> cacheImages(List<String> paths) async {
    for (final String path in paths) {
      await precacheImage(
        NetworkImage(
          path,
        ),
        Get.context!,
      );
      print('images cached ');
    }
  }

  static Future<String?> languageSelection() async {
    return Get.bottomSheet<String?>(
      WillPopScope(
        onWillPop: () async {
          final result = await showAlertDialog(
            enableCancel: true,
            contentText: S.current.defaultLang(
              isLtr ? 'English' : 'العربيه',
            ),
          );
          if (result == null) {
            return false;
          } else {
            return result;
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            color: ColorUtil.whiteScaffold,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.current.selectLanguageTitle,
                style: TextStyle(
                  color: ColorUtil.blackColor,
                  fontSize: 66.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              AppButton(
                height: 40.0,
                title: 'English',
                backgroundColor: isLtr ? null : Colors.transparent,
                borderColor: isLtr ? null : ColorUtil.primaryColor,
                textColor: isLtr ? null : ColorUtil.primaryColor,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                onTap: () async {
                  await S.load(const Locale('en'));
                  return Get.back(result: 'en');
                },
              ),
              AppButton(
                height: 40.0,
                title: 'العربيه',
                backgroundColor: !isLtr ? null : Colors.transparent,
                borderColor: !isLtr ? null : ColorUtil.primaryColor,
                textColor: !isLtr ? null : ColorUtil.primaryColor,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                onTap: () async {
                  await S.load(const Locale('ar'));
                  return Get.back(result: 'ar');
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      isDismissible: false,
    );
  }

  static Future<List<File>> pickFiles({
    bool allowMultiple = false,
    FileType fileType = FileType.image,
    bool allowCompression = true,
  }) async {
    List<File> files = <File>[];
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple,
        type: fileType,
        allowCompression: allowCompression,
      );
      if (result != null) {
        for (final file in result.files) {
          print(file.name);
          print(file.path);
          if (allowCompression) {
            final compressedFile =
                await compressFile(File(file.path!), file.name);
            files.add(compressedFile!);
          } else {
            files.add(File(file.path!));
          }
        }
      }
    } catch (e) {
      print('FilePicker error : ${e.toString()}');
    }
    return files;
  }

  static Future<File?> compressFile(File? file, String? filename) async {
    final dir = await getTemporaryDirectory();
    file!.writeAsBytesSync(file.readAsBytesSync().buffer.asUint8List());
    final targetPath = "${dir.absolute.path}${"/$filename"}";
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 50,
    );
    print(file.lengthSync());
    print(result!.lengthSync());
    return result;
  }

  static Future<DateTime?> chooseDateTime({
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  }) async {
    DateTime result = DateTime.now();
    return Get.bottomSheet<DateTime>(
      Container(
        height: Get.height * 0.40,
        decoration: const BoxDecoration(
          color: ColorUtil.whiteScaffold,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 30.0,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: isLtr
                  ? CupertinoDatePicker(
                      onDateTimeChanged: (DateTime value) {
                        result = value;
                      },
                      minimumYear: 1900,
                      maximumYear: DateTime.now()
                          .add(
                            const Duration(days: 366),
                          )
                          .year,
                      initialDateTime: DateTime.now(),
                      mode: mode,
                    )
                  : Localizations(
                      locale: const Locale('ar', 'EG'),
                      delegates: const [
                        S.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (DateTime value) {
                            result = value;
                          },
                          minimumYear: 1900,
                          maximumYear: DateTime.now()
                              .add(
                                const Duration(days: 366),
                              )
                              .year,
                          initialDateTime: DateTime.now(),
                          mode: mode,
                        ),
                      ),
                    ),
            ),
            AppButton(
              height: 45.0,
              title: S.current.confirm,
              onTap: () => Get.back(result: result),
            ),
          ],
        ),
      ),
      isDismissible: false,
    );
  }

  static Future<T?> openBottomSheetList<T>(
    List<T> items,
    String Function(T item)? listDisplayFunc,
  ) async {
    if (listDisplayFunc != null && items.isNotEmpty) {
      T? result = items[0];
      return Get.bottomSheet<T>(
        Container(
          height: Get.height * 0.35,
          decoration: const BoxDecoration(
            color: ColorUtil.whiteScaffold,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 10.0,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: CupertinoPicker(
                  backgroundColor: ColorUtil.whiteScaffold,
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(),
                  onSelectedItemChanged: (int index) => result = items[index],
                  children: items
                      .map<Widget>(
                        (T value) => Text(
                          listDisplayFunc(value),
                          style: const TextStyle(
                            color: ColorUtil.darkBlue,
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )
                      .toList(),
                ),
              ),
              AppButton(
                height: 45.0,
                title: S.current.confirm,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                onTap: () => Get.back(result: result),
              ),
            ],
          ),
        ),
        isDismissible: false,
      );
    }
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Future<void> callPhone(
    BuildContext context, {
    required List<String> phoneNumbers,
  }) async {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            actions: <Widget>[
              ...phoneNumbers.map((e) {
                final url = 'tel://$e';
                return CupertinoActionSheetAction(
                  onPressed: () async {
                    try {
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: ColorUtil.primaryColor,
                    ),
                  ),
                );
              }).toList(),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back(result: true);
              },
              child: Text(
                S.current.cancel,
              ),
            ),
          );
        },
      );
    } else {
      await Get.bottomSheet(
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: ListView.builder(
            itemCount: phoneNumbers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final url = 'tel://${phoneNumbers[index]}';
              return ListTile(
                title: Text(
                  phoneNumbers[index],
                  style: const TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                onTap: () async {
                  try {
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              );
            },
          ),
        ),
      );
    }
  }
}
