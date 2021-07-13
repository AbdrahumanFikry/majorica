import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/app/utilities/validators.dart';
import 'package:majorica/generated/l10n.dart';

class LoginView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: ColorUtil.whiteColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height -
              (Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom),
          child: Obx(
            () => Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200.sp,
                  ),
                  Image.asset(
                    PathUtil.authPNG,
                    height: 300.sp,
                    width: 300.sp,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    S.of(context).signIn,
                    style: AppUtil.textStyle(
                      color: ColorUtil.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 70.sp,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AppTextField(
                    controller.phone,
                    keyBoardType: TextInputType.phone,
                    labelText: S.of(context).phoneNumber,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    prefixWidget: const Icon(
                      Icons.person,
                      color: ColorUtil.primaryColor,
                      size: 20.0,
                    ),
                    validator: const QuickTextValidator(),
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
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    validator: const QuickTextValidator(
                      hasMinLength: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: AppUtil.isLtr
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 3.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.password.clear();
                          controller.confirmedPassword.clear();
                          controller.forgetPassword(true);
                          controller.changePassword(false);
                          Get.toNamed(Routes.ACCOUNT);
                        },
                        child: Text(
                          S.of(context).forgetPassword,
                          style: AppUtil.textStyle(
                            color: ColorUtil.mediumGrey,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  AppButton(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    isBusy: controller.busyId.value == 'login',
                    title: S.of(context).enter,
                    onTap: controller.login,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).donNotHaveAcc,
                        style: AppUtil.textStyle(
                          color: ColorUtil.mediumGrey,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          controller.password.clear();
                          controller.confirmedPassword.clear();
                          controller.forgetPassword(false);
                          controller.changePassword(false);
                          Get.toNamed(Routes.ACCOUNT);
                        },
                        child: Text(
                          S.of(context).signUp,
                          style: AppUtil.textStyle(
                            color: ColorUtil.darkBlue,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
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
