import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/app/utilities/validators.dart';
import 'package:majorica/generated/l10n.dart';

class ResetPasswordView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: ColorUtil.whiteColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height -
              (Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(
              () => Form(
                key: controller.resetPasswordFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.sp,
                    ),
                    Image.asset(
                      PathUtil.forgotPasswordPNG,
                      height: 500.sp,
                      width: 500.sp,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      S.of(context).resetPasswordDesc,
                      style: AppUtil.textStyle(
                        color: ColorUtil.darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (controller.changePassword.value)
                      AppTextField(
                        controller.oldPassword,
                        isPassword: true,
                        labelText: S.of(context).oldPassword,
                        hidePassword: controller.hidePassword.value,
                        changeObscuring: controller.changeObscuring,
                        prefixWidget: const Icon(
                          CupertinoIcons.lock_open_fill,
                          color: ColorUtil.primaryColor,
                          size: 20.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        validator: const QuickTextValidator(
                          hasMinLength: 8,
                        ).call,
                      ),
                    AppTextField(
                      controller.password,
                      isPassword: true,
                      labelText: S.of(context).password,
                      hidePassword: controller.hidePassword.value,
                      changeObscuring: controller.changeObscuring,
                      prefixWidget: const Icon(
                        CupertinoIcons.lock_fill,
                        color: ColorUtil.primaryColor,
                        size: 20.0,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      validator: const QuickTextValidator(
                        hasMinLength: 8,
                      ).call,
                    ),
                    AppTextField(
                      controller.confirmedPassword,
                      isPassword: true,
                      labelText: S.of(context).confirmPassword,
                      readOnly: controller.isBusy.value,
                      hidePassword: controller.hidePassword.value,
                      changeObscuring: controller.changeObscuring,
                      validator: QuickTextValidator(
                        extraValidation: (String? value) {
                          if (controller.password.text !=
                              controller.confirmedPassword.text) {
                            return S.current.passwordsDoNotMatch;
                          }
                          return null;
                        },
                        hasMinLength: 8,
                      ).call,
                      prefixWidget: const Icon(
                        CupertinoIcons.lock_fill,
                        color: ColorUtil.primaryColor,
                        size: 20.0,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    AppButton(
                      isBusy: controller.busyId.value == 'reset',
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      title: S.of(context).enter,
                      onTap: controller.resetPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
