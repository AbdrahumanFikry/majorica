import 'package:flutter/material.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

class Coupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: AppTextField(
                  null,
                  underLine: false,
                  hintText: S.of(context).enterDiscountCoupon,
                  hintColor: ColorUtil.mediumGrey,
                ),
              ),
              Expanded(
                child: AppButton(
                  elevation: 2.0,
                  title: S.of(context).done,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
