import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/loading.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: ColorUtil.whiteColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: EdgeInsets.only(
              right: 20.0,
              top: Get.mediaQuery.padding.top +
                  Get.mediaQuery.padding.bottom +
                  20,
              bottom: 10.0,
              left: 20.0,
            ),
            child: Obx(
              () => Column(
                children: [
                  Image.asset(
                    PathUtil.otpPNG,
                    height: 600.sp,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    S.of(context).otpSendDone,
                    style: AppUtil.textStyle(
                      color: ColorUtil.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.sp,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: AppUtil.isLtr
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        S.of(context).enterCode,
                        style: AppUtil.textStyle(
                          color: ColorUtil.darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if (controller.busyId.value == 'otp')
                    Expanded(
                      child: Loading(),
                    )
                  else
                    PinCodeTextField(
                      autofocus: true,
                      controller: controller.otp,
                      highlight: true,
                      errorBorderColor: ColorUtil.errorColor,
                      pinBoxRadius: 10,
                      pinBoxBorderWidth: 1.0,
                      highlightColor: ColorUtil.darkBlue,
                      defaultBorderColor: ColorUtil.darkBlue,
                      hasTextBorderColor: ColorUtil.darkBlue,
                      highlightPinBoxColor: ColorUtil.whiteColor,
                      hasError: controller.pinCodeError.value.isNotEmpty,
                      onDone: (text) async {
                        print("Entered Otp : $text");
                        await controller.sendOTP();
                      },
                      pinBoxWidth: 175.sp,
                      pinBoxHeight: 175.sp,
                      wrapAlignment: WrapAlignment.spaceAround,
                      pinBoxDecoration:
                          ProvidedPinBoxDecoration.roundedPinBoxDecoration,
                      pinTextStyle: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.darkBlue,
                      ),
                      pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.defaultNoTransition,
                      pinTextAnimatedSwitcherDuration: const Duration(
                        milliseconds: 300,
                      ),
                      highlightAnimation: true,
                      highlightAnimationBeginColor: Colors.black,
                      highlightAnimationEndColor: ColorUtil.primaryColor,
                    ),
                  if (controller.pinCodeError.value.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        controller.pinCodeError.value,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 50.sp,
                          color: ColorUtil.errorColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const Spacer(),
                  AppButton.icon(
                    height: 100.0,
                    innerSpace: 20.0,
                    isBusy: controller.busyId.value == 'registerOTPAgain',
                    margin: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    backgroundColor: controller.isCounting.value
                        ? ColorUtil.lightGrey
                        : ColorUtil.primaryColor,
                    textColor: controller.isCounting.value
                        ? ColorUtil.mediumGrey
                        : ColorUtil.whiteColor,
                    elevation: controller.isCounting.value ? 0.0 : 5.0,
                    title: S.of(context).sendAgain,
                    onTap: () async {
                      if (!controller.isCounting.value) {
                        await controller.sendOTPAgain();
                        controller.countDownController.restart(duration: 60);
                      }
                    },
                    icon: CircularCountDownTimer(
                      duration: 60,
                      controller: controller.countDownController,
                      width: 150.sp,
                      height: 150.sp,
                      ringColor: ColorUtil.lightGrey,
                      fillColor: ColorUtil.primaryColor,
                      backgroundColor: ColorUtil.whiteScaffold,
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                        fontSize: 70.sp,
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textFormat: CountdownTextFormat.SS,
                      onStart: () => controller.isCounting(true),
                      isReverse: true,
                      onComplete: () {
                        controller.countDownController.pause();
                        controller.isCounting(false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
