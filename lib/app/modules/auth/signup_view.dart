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

class SignUpView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: ColorUtil.whiteColor,
      body: Obx(
        () => Form(
          key: controller.personalDataFormKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: [
              SizedBox(
                height: 200.sp,
              ),
              Image.asset(
                PathUtil.authPNG,
                height: 400.sp,
                width: 400.sp,
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(
                S.of(context).createUserAccount,
                style: AppUtil.textStyle(
                  color: ColorUtil.darkBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 40.sp,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15.0,
              ),
              AppTextField(
                controller.name,
                labelText: S.of(context).name,
                readOnly: controller.isBusy.value,
                validator: const QuickTextValidator(),
                prefixWidget: const Icon(
                  Icons.person,
                  color: ColorUtil.primaryColor,
                  size: 20.0,
                ),
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
              Row(
                children: [
                  Checkbox(
                    activeColor: ColorUtil.primaryColor,
                    checkColor: ColorUtil.whiteColor,
                    value: controller.agreeToTermsAndConditions.value,
                    onChanged: (bool? value) =>
                        controller.agreeToTermsAndConditions(value),
                  ),
                  Text(
                    S.of(context).agreeToTermsAndConditions,
                    style: AppUtil.textStyle(
                      color: ColorUtil.darkBlue,
                      fontSize: 42.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              AppButton(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                isBusy: controller.busyId.value == 'personal',
                title: S.of(context).continueNext,
                onTap: controller.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
