import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:get/get.dart';
import 'package:majorica/generated/l10n.dart';

import 'info_line.dart';

class DetailsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 220.sp,
      right: 0.0,
      left: 0.0,
      // bottom: 0.0,
      child: GlobalCard(
        color: ColorUtil.whiteColor,
        elevation: 10.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: AnimatedListHandler(
            disableGlow: true,
            shrinkWrap: true,
            children: [
              Text(
                'Double room',
                style: AppUtil.textStyle(
                  color: ColorUtil.darkBlue,
                  fontSize: 65.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              InfoLine(
                title: S.of(context).packages,
                info: 'Bed only',
              ),
              InfoLine(
                title: S.of(context).participants,
                info: '2',
              ),
              InfoLine(
                title: S.of(context).total,
                info: '1500 ${S.of(context).egp}',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FDottedLine(
                  color: ColorUtil.mediumGrey,
                  width: Get.width,
                  strokeWidth: 2.0,
                  dottedLength: 15.sp,
                  space: 2.0,
                ),
              ),
              Text(
                S.of(context).paymentDetails,
                style: AppUtil.textStyle(
                  color: ColorUtil.darkBlue,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InfoLine(
                      title: S.of(context).id,
                      info: '#123',
                      mini: true,
                    ),
                  ),
                  Expanded(
                    child: InfoLine(
                      title: S.of(context).refID,
                      info: '#1234567',
                      mini: true,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InfoLine(
                      title: S.of(context).amount,
                      info: '1500',
                      mini: true,
                    ),
                  ),
                  Expanded(
                    child: InfoLine(
                      title: S.of(context).paidFor,
                      info: '010203040',
                      mini: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FDottedLine(
                  color: ColorUtil.mediumGrey,
                  width: Get.width,
                  strokeWidth: 2.0,
                  dottedLength: 15.sp,
                  space: 2.0,
                ),
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                iconColor: ColorUtil.primaryColor,
                title: Text(
                  S.of(context).moreDetails,
                  style: AppUtil.textStyle(
                    color: ColorUtil.darkBlue,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: List.generate(
                  2,
                  (index) => InfoLine(
                    title: S.of(context).total,
                    info: '1500 ${S.of(context).egp}',
                  ),
                ),
              ),
              AppButton(
                width: 400.sp,
                backgroundColor: Colors.transparent,
                borderColor: ColorUtil.errorColor,
                textColor: ColorUtil.errorColor,
                title: S.of(context).cancelReservation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
