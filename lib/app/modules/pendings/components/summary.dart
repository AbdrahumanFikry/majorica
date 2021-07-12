import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

class Summary extends GetView<PendingsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      elevation: 10.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      color: ColorUtil.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  S.of(context).total,
                  style: AppUtil.textStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.darkBlue,
                  ),
                ),
                Expanded(
                  child: Text(
                    '1800 ${S.of(context).egp}',
                    style: AppUtil.textStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtil.primaryColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  S.of(context).discount,
                  style: AppUtil.textStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.darkBlue,
                  ),
                ),
                Expanded(
                  child: Text(
                    '100 ${S.of(context).egp}',
                    style: AppUtil.textStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtil.primaryColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            // AppTextField(
            //   null,
            //   underLine: false,
            //   hintText: S.of(context).enterDiscountCoupon,
            //   hintColor: ColorUtil.mediumGrey,
            // ),
            AppButton(
              elevation: 2.0,
              onTap: controller.confirmReservation,
              margin: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).confirmReservation,
                    style: AppUtil.textStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '1700 ${S.of(context).egp}',
                    style: AppUtil.textStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorUtil.whiteColor,
                    ),
                    textAlign: TextAlign.end,
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
