import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/app/utilities/validators.dart';
import 'package:majorica/generated/l10n.dart';

class AccountView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: ColorUtil.whiteScaffold,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height -
              (Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: controller.accountFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200.sp,
                  ),
                  Image.asset(
                    PathUtil.checkPNG,
                    height: 600.sp,
                    width: 600.sp,
                  ),
                  const Spacer(),
                  Align(
                    alignment: AppUtil.isLtr
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: Text(
                      S.of(context).enterOwnPhone,
                      style: AppUtil.textStyle(
                        color: ColorUtil.darkBlue,
                        fontWeight: FontWeight.w800,
                        fontSize: 54.sp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: AppUtil.isLtr
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: Text(
                      S.of(context).phoneHint,
                      style: AppUtil.textStyle(
                        color: ColorUtil.mediumGrey,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300,
                        fontSize: 43.sp,
                        height: 1.5,
                      ),
                    ),
                  ),
                  AppTextField(
                    controller.phone,
                    borderColor: ColorUtil.mediumGrey,
                    labelText: S.of(context).phoneNumber,
                    keyBoardType: TextInputType.number,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    prefixWidget: GlobalCard(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 2.5,
                      ),
                      child: CountryCodePicker(
                        onChanged: (val) =>
                            controller.countryCode(val.dialCode),
                        initialSelection: 'EG',
                        favorite: const ['+20', 'EG'],
                        showFlagMain: false,
                        showCountryOnly: true,
                      ),
                    ),
                    validator: const QuickTextValidator(
                      isPhone: true,
                    ),
                  ),
                  Obx(
                    () => AppButton(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      isBusy: controller.busyId.value == 'checkMobile',
                      backgroundColor: ColorUtil.primaryColor,
                      title: S.of(context).confirm,
                      onTap: controller.checkMobile,
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
