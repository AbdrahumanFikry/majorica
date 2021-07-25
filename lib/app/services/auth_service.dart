import 'dart:io';

import 'package:bdaya_fcm_handler/bdaya_fcm_handler.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:majorica/app/data/models/user.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/analytics_service.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

import 'cache_service.dart';

class AuthService extends GetxService with BusyMixin, ApiMixin {
  final currentUser = Rxn<User>();
  final currentFCMToken = RxnString();

  static AuthService get to => Get.find<AuthService>();
  GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> personalDataFormKey = GlobalKey<FormState>();
  TextEditingController accountId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();

  late CountDownController countDownController = CountDownController();

  final genderValue = 'male'.obs;
  final countryCode = '+20'.obs;
  final pinCodeError = RxString('');
  final forgetPassword = false.obs;
  final changePassword = false.obs;
  final hidePassword = true.obs;
  final agreeToTermsAndConditions = true.obs;
  final frontId = Rx<File>(File(''));
  final rearId = Rx<File>(File(''));
  final commercialRegisterImage = Rx<File>(File(''));
  final taxCardImage = Rx<File>(File(''));
  final isCounting = true.obs;
  final otpHash = ''.obs;
  final tempPassword = ''.obs;
  final registerHash = ''.obs;
  final sessionID = ''.obs;
  final numChecked = false.obs;

  void changeObscuring() {
    hidePassword(!hidePassword.value);
  }

  Future<void> login() async {
    final formData = accountFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        startBusyWithId('login');
        final response = await post(
          ApiUtil.authClient,
          body: {
            "mobileNum": "${countryCode.value}${phone.text}",
            "password": password.text,
          },
        );
        if (response['OTPHash'] != null) {
          otpHash(response['OTPHash']);
          password.clear();
          accountId.clear();
          changePassword(false);
          forgetPassword(false);
          numChecked(false);
          Get.toNamed(Routes.OTP);
        } else if (response['sessionID'] != null) {
          sessionID(response['sessionID']);
          password.clear();
          accountId.clear();
          changePassword(false);
          forgetPassword(false);
          numChecked(false);
          await loadApp();
          Get.offAllNamed(Routes.ROOT);
        }
        endBusySuccess();
      } catch (error) {
        endBusyError(error.toString(), showDialog: true);
      }
    }
  }

  Future<void> checkMobile() async {
    final formData = accountFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        startBusyWithId('checkMobile');
        Map<String, dynamic> response;
        if (forgetPassword.value) {
          response = await post(
            ApiUtil.forgetPassword,
            body: {
              "mobileNum": "${countryCode.value}${phone.text}",
            },
          );
        } else {
          response = await post(
            ApiUtil.checkMobile,
            body: {
              "mobileNum": "${countryCode.value}${phone.text}",
            },
          );
        }
        if (response['OTPHash'] != null) {
          otpHash(response['OTPHash']);
          Get.offAllNamed(Routes.OTP);
        } else if (response['checkMobile'] == true) {
          numChecked(true);
        }
        endBusySuccess();
      } catch (error) {
        endBusyError(error.toString(), showDialog: true);
      }
    }
  }

  Future<void> sendOTPAgain() async {
    try {
      startBusyWithId('registerOTPAgain');
      final response = await post(
        ApiUtil.resendOTP,
        body: {
          "OTPHash": otpHash.value,
        },
      );
      if (response['Success'] != 'true') {
        otp.clear();
        isCounting(true);
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error.toString(), showDialog: true);
    }
  }

  Future<void> sendOTP() async {
    pinCodeError('');
    try {
      if (otp.text.isNotEmpty && otp.text.length == 4) {
        if (forgetPassword.value) {
          await _sendOTPAndResetPassword();
        } else {
          await _sendOTPForRegisterOrLogin();
        }
        phone.clear();
        otp.clear();
      } else {
        pinCodeError(S.current.fourDigitsIsAMust);
      }
    } catch (error) {
      pinCodeError(error.toString());
    }
    endBusySuccess();
  }

  Future<void> _sendOTPForRegisterOrLogin() async {
    try {
      startBusyWithId('otp');
      final response = await post(
        ApiUtil.verifyOTP,
        body: {
          "OTPHash": otpHash.value,
          "OTPCode": otp.text,
        },
      );
      if (response['registerHash'] != null) {
        registerHash(response['registerHash']);
        otp.clear();
        Get.offAllNamed(Routes.SIGN_UP);
      } else if (response['sessionID'] != null) {
        sessionID(response['sessionID']);
        currentUser(null);
        otp.clear();
        await loadApp();
        Get.offAllNamed(Routes.ROOT);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _sendOTPAndResetPassword() async {
    try {
      startBusyWithId('otp');
      final response = await post(
        ApiUtil.verifyOTP,
        body: {
          "OTPHash": otpHash.value,
          "OTPCode": otp.text,
        },
      );
      if (response['tempPassword'] != null) {
        tempPassword(response['tempPassword']);
        otp.clear();
        Get.offAllNamed(Routes.RESET_PASSWORD);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signUp() async {
    final formData = personalDataFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        if (agreeToTermsAndConditions.value) {
          startBusyWithId('personal');
          final response = await post(
            ApiUtil.registerClient,
            body: {
              "registerHash": registerHash.value,
              "name": name.text,
              "password": password.text,
            },
          );
          if (response['SessionID'] != null) {
            sessionID(response['SessionID']);
            name.clear();
            password.clear();
            confirmedPassword.clear();
            await loadApp();
            Get.offAllNamed(Routes.ROOT);
          }
          endBusySuccess();
        } else {
          throw S.current.termsAndConditionsValidation;
        }
      } catch (error) {
        endBusyError(error.toString(), showDialog: true);
      }
    }
  }

  Future<void> loadApp({String? localSession}) async {
    try {
      final response = await post(
        ApiUtil.loadApp,
        body: {
          "sessionID": localSession ?? sessionID.value,
        },
      );
      if (response['success'] == true) {
        await CacheService.to.appDataRepo.updateAppDataCache(
          response,
        );
        await CacheService.to.userRepo.updateUserCache(
          response['user'],
          sessionID.value,
        );
      }
    } catch (error) {
      if (localSession == null) {
        rethrow;
      }
      // endBusyError(error.toString(), showDialog: true);
    }
  }

  Future<void> resetPassword() async {
    final formData = resetPasswordFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        startBusyWithId('reset');
        if (changePassword.value) {
          await _changeUserPassword();
        } else {
          await _resetPasswordByOTP();
        }
      } catch (error) {
        endBusyError(error.toString(), showDialog: true);
      }
    }
  }

  Future<void> _resetPasswordByOTP() async {
    try {
      final response = await post(
        ApiUtil.forgetPassword,
        body: {
          "tempPassword": tempPassword.value,
          "newPassword": password.text,
        },
      );
      if (response['sessionID'] != null) {
        accountId.clear();
        password.clear();
        confirmedPassword.clear();
        phone.clear();
        otp.clear();
        await loadApp();
        endBusySuccess();
        Get.offAllNamed(Routes.ROOT);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _changeUserPassword() async {
    try {
      final response = await post(
        ApiUtil.changePassword,
        body: {
          "sessionID": currentUser.value!.sessionID,
          "oldPassword": oldPassword.text,
          "newPassword": password.text,
        },
      );
      if (response['success'] == true) {
        oldPassword.clear();
        password.clear();
        confirmedPassword.clear();
        numChecked(true);
        endBusySuccess();
        Get.offAllNamed(Routes.ACCOUNT);
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  void onReady() {
    CacheService.to.userRepo.firstEntryStream().listen(
      (event) async {
        print('New update in user info');
        if (event == null) {
          currentUser.value = null;
        } else {
          currentUser(event.value);
          sessionID(currentUser.value!.sessionID);
          await AnalyticsService.to
              .setUserProperties(userId: currentUser.value!.name);
          final token =
              currentFCMToken.value = await fcmServiceFinder!()?.getToken(
            vapidKey:
                "BOJ21GyEl9SKGIlzaPnNmxTa5qKP2Mty-GDsjq62FPu28x2FmUmXBOPNc2SBXtxm9XUuW7BJGXoun0cNK8JaStk",
          );
          try {
            await post(
              ApiUtil.updatePushToken,
              body: {
                "sessionID": sessionID.value,
                "token": token,
              },
            );
          } catch (e) {
            printError(info: e.toString());
          }
        }
      },
    );
    super.onReady();
  }
}
