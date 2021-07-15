import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/reservation_details/controllers/reservation_details_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:get/get.dart';
import 'package:majorica/generated/l10n.dart';

import 'info_line.dart';

class DetailsBlock extends GetView<ReservationDetailsController> {
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
          child: Obx(
            () {
              final res = controller.reservationDetails.value;
              return AnimatedListHandler(
                disableGlow: true,
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          res!.roomType!,
                          style: AppUtil.textStyle(
                            color: ColorUtil.darkBlue,
                            fontSize: 65.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '#${res.iD!}',
                        style: AppUtil.textStyle(
                          color: ColorUtil.errorColor,
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InfoLine(
                    title: S.of(context).packages,
                    info: res.roomPackage!,
                  ),
                  InfoLine(
                    title: S.of(context).participants,
                    info: res.sleeps!,
                  ),
                  InfoLine(
                    title: S.of(context).total,
                    info: '${res.reservationTotal} ${S.of(context).egp}',
                  ),
                  if (res.offerName != null)
                    InfoLine(
                      title: S.of(context).offer,
                      info: res.offerName!,
                    ),
                  if (res.paymentDetails != null) ...[
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
                            info: '#${res.paymentDetails!.paymentID!}',
                            mini: true,
                          ),
                        ),
                        Expanded(
                          child: InfoLine(
                            title: S.of(context).refID,
                            info: '#${res.paymentDetails!.orderRefID!}',
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
                            info:
                                '${res.paymentDetails!.paymentAmount!} ${S.of(context).egp}',
                            mini: true,
                          ),
                        ),
                        Expanded(
                          child: InfoLine(
                            title: S.of(context).paidFor,
                            info: '#${res.paymentDetails!.reservationIDs!}',
                            mini: true,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  if (res.reservation!.isNotEmpty)
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
                      children: res.reservation!
                          .map(
                            (detail) => InfoLine(
                              title: detail.date!,
                              info: '${detail.price!} ${S.of(context).egp}',
                            ),
                          )
                          .toList(),
                    ),
                  if (res.refundable != null)
                    Text(
                      res.refundable!,
                      style: AppUtil.textStyle(
                        color: res.statusColor != null
                            ? AppUtil.fromHex(res.refundableColor!)
                            : ColorUtil.whiteColor,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  if (res.statusText!.toLowerCase() != 'canceled')
                    AppButton(
                      isBusy: controller.isBusy.value,
                      width: 400.sp,
                      backgroundColor: Colors.transparent,
                      borderColor: ColorUtil.errorColor,
                      textColor: ColorUtil.errorColor,
                      title: S.of(context).cancelReservation,
                      onTap: controller.cancelReservation,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
