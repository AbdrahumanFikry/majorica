import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/root/controllers/root_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class SuccessPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                PathUtil.successLottie,
                height: 600.sp,
                width: 600.sp,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                S.of(context).paymentDoneSuccessfully,
                style: AppUtil.textStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                S.of(context).uploadYourData,
                style: AppUtil.textStyle(
                  fontSize: 44.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              AppButton(
                title: S.of(context).documents,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                onTap: () => Get.offNamed(Routes.DOCUMENTS),
              ),
              AppButton(
                title: S.of(context).reservations,
                backgroundColor: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                onTap: () {
                  RootController.to.currentPage(1);
                  Get.offNamedUntil(Routes.ROOT, (route) => false);
                },
              ),
              AppButton(
                title: S.of(context).home,
                backgroundColor: ColorUtil.darkBlue,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                onTap: () {
                  RootController.to.currentPage(0);
                  Get.offNamedUntil(Routes.ROOT, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
