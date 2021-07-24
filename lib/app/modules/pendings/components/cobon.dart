import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/waiting.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

class Coupon extends GetView<PendingsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).discountCoupon,
              style: AppUtil.textStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtil.darkBlue,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Waiting(
              loading: controller.busyId.value == 'Coupon',
              margin: EdgeInsets.zero,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: AppTextField(
                      controller.couponController,
                      underLine: false,
                      readOnly: controller.couponApplied.value,
                      hintText: S.of(context).enterDiscountCoupon,
                      hintColor: ColorUtil.mediumGrey,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AppButton(
                      elevation: 2.0,
                      title: controller.couponApplied.value
                          ? S.of(context).removeCoupon
                          : S.of(context).done,
                      onTap: () => controller.applyCoupon(
                        remove: controller.couponApplied.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
