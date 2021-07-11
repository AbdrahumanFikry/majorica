import 'dart:io';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

class AuthService extends GetxService with BusyMixin, ApiMixin {
  static AuthService get to => Get.find<AuthService>();
  GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> personalDataFormKey = GlobalKey<FormState>();
  TextEditingController accountId = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();
  TextEditingController tradeName = TextEditingController();
  TextEditingController governorate = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController birthDate = TextEditingController();

  late CountDownController countDownController = CountDownController();

  final genderValue = 'male'.obs;
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

  void changeObscuring() {
    hidePassword(!hidePassword.value);
  }

  Future<void> login() async {
    final formData = loginFormKey.currentState;
    // if (formData!.validate()) {
    //   formData.save();
    //   try {
    //     startBusyWithId('login');
    //     final Map<String, dynamic> response = await post(
    //       body: {
    //         "Action": "Auth",
    //         "UserID": accountId.text,
    //         "Password": password.text,
    //       },
    //     );
    //     if (response['OTPHash'] != null) {
    //       otpHash(response['OTPHash']);
    //       password.clear();
    //       accountId.clear();
    //       changePassword(false);
    //       forgetPassword(false);
    //       Get.toNamed(Routes.OTP);
    //     } else if (response['SessionID'] != null) {
    //       sessionID(response['SessionID']);
    //       password.clear();
    //       accountId.clear();
    //       changePassword(false);
    //       forgetPassword(false);
    //       await loadApp();
    //       Get.offAllNamed(Routes.ROOT);
    //     }
    //     endBusySuccess();
    //   } catch (error) {
    //     endBusyError(error.toString(), showDialog: true);
    //   }
    // }
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
            ApiUtil.checkMobile,
            body: {
              "UserID": accountId.text,
            },
          );
        } else {
          response = await post(
            ApiUtil.checkMobile,
            body: {
              "mobileNum": "2${phone.text}",
            },
          );
        }
        if (response['OTPHash'] != null) {
          otpHash(response['OTPHash']);
          Get.toNamed(Routes.OTP);
        }
        endBusySuccess();
      } catch (error) {
        endBusyError(error.toString(), showDialog: true);
      }
    }
  }

  Future<void> sendOTPAgain() async {
    // try {
    //   startBusyWithId('registerOTPAgain');
    //   final response = await post(
    //     body: {
    //       "Action": "ResendOTP",
    //       "OTPHash": otpHash.value,
    //     },
    //   );
    //   if (response['Success'] != 'true') {
    //     otp.clear();
    //     isCounting(true);
    //   }
    //   endBusySuccess();
    // } catch (error) {
    //   endBusyError(error.toString(), showDialog: true);
    // }
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
    // try {
    //   startBusyWithId('otp');
    //   final response = await post(
    //     body: {
    //       "Action": "VerifyOTP",
    //       "OTPHash": otpHash.value,
    //       "OTPCode": otp.text,
    //     },
    //   );
    //   if (response['RegisterHash'] != null) {
    //     registerHash(response['RegisterHash']);
    //     otp.clear();
    //     Get.offAllNamed(Routes.PERSONAL_DATA);
    //   } else if (response['Fingerprint'] != null &&
    //       response['SessionID'] != null) {
    //     sessionID(response['SessionID']);
    //     otp.clear();
    //     await loadApp();
    //     Get.offAllNamed(Routes.ROOT);
    //   }
    // } catch (error) {
    //   rethrow;
    // }
  }

  Future<void> _sendOTPAndResetPassword() async {
    // try {
    //   startBusyWithId('otp');
    //   final response = await post(
    //     body: {
    //       "Action": "VerifyOTP",
    //       "OTPHash": otpHash.value,
    //       "OTPCode": otp.text,
    //     },
    //   );
    //   if (response['TempPassword'] != null) {
    //     tempPassword(response['TempPassword']);
    //     otp.clear();
    //     Get.offAllNamed(Routes.RESET_PASSWORD);
    //   }
    // } catch (error) {
    //   rethrow;
    // }
  }

  Future<void> sendPersonalData() async {
    final formData = personalDataFormKey.currentState;
    // if (formData!.validate()) {
    //   formData.save();
    //   try {
    //     if (agreeToTermsAndConditions.value) {
    //       startBusyWithId('personal');
    //       final response = await post(
    //         body: {
    //           "Action": "Register",
    //           "RegisterHash": registerHash.value,
    //           "Name": name.text,
    //           "Password": "123",
    //           "Birthday": birthDate.text,
    //           "Gender": 1,
    //           "Address": address.text,
    //           "BusinessName": tradeName.text,
    //         },
    //       );
    //       if (response['RegisterHash'] != null) {
    //         registerHash(response['RegisterHash']);
    //         name.clear();
    //         birthDate.clear();
    //         governorate.clear();
    //         address.clear();
    //         tradeName.clear();
    //         Get.offAllNamed(Routes.PROFESSIONAL_DATA);
    //       }
    //       endBusySuccess();
    //     } else {
    //       throw S.current.termsAndConditionsValidation;
    //     }
    //   } catch (error) {
    //     endBusyError(error.toString(), showDialog: true);
    //   }
    // }
  }

  Future<void> signUp() async {
    // try {
    //   if (frontId.value.path.isNotEmpty && rearId.value.path.isNotEmpty) {
    //     startBusyWithId('signUp');
    //     final response = await post(
    //       body: {
    //         "Action": "Register",
    //         "RegisterHash": registerHash.value,
    //         "Uploads": filesToBase64(
    //           {
    //             "IDFace": frontId.value,
    //             "IDBack": rearId.value,
    //             "CommercialRegistration": commercialRegisterImage.value,
    //             "TaxCard": taxCardImage.value,
    //           },
    //         ),
    //       },
    //     );
    //     endBusySuccess();
    //     if (response['Message'] != null) {}
    //   } else {
    //     throw S.current.idValidation;
    //   }
    // } catch (error) {
    //   endBusyError(error.toString(), showDialog: true);
    // }
  }

  Future<void> loadApp() async {
    // try {
    //   final appLoadedData = AppLoadedData.fromJson(
    //     await post(
    //       body: {
    //         "Action": "LoadApp",
    //         "SessionID": sessionID.value,
    //         "Fingerprint": fingerprint.value,
    //       },
    //     ),
    //   );
    //   appLoadedData.user!.fingerprint = fingerprint.value;
    //   appLoadedData.user!.sessionID = sessionID.value;
    //   CacheService.to.userRepo.updateUserCache(appLoadedData);
    // } catch (error) {
    //   // endBusyError(error.toString(), showDialog: true);
    //   rethrow;
    // }
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
    // try {
    //   final response = await post(
    //     body: {
    //       "Action": "ForgetPassword",
    //       "UserID": accountId.text,
    //       "TempPassword": tempPassword.value,
    //       "NewPassword": password.text,
    //     },
    //   );
    //   accountId.clear();
    //   password.clear();
    //   confirmedPassword.clear();
    //   phone.clear();
    //   otp.clear();
    //   endBusySuccess();
    //   Get.offAllNamed(Routes.LOGIN);
    // } catch (error) {
    //   rethrow;
    // }
  }

  Future<void> _changeUserPassword() async {
    // try {
    //   final response = await post(
    //     body: {
    //       "Action": "ChangePassword",
    //       "SessionID": sessionID.value,
    //       "OldPassword": oldPassword.text,
    //       "NewPassword": password.text,
    //     },
    //   );
    //   oldPassword.clear();
    //   password.clear();
    //   confirmedPassword.clear();
    //   endBusySuccess();
    //   Get.offAllNamed(Routes.LOGIN);
    // } catch (error) {
    //   rethrow;
    // }
  }
}
