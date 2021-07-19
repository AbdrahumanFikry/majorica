import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/data/models/all_reservations.dart';
import 'package:majorica/app/modules/reservations/components/res_info_item.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:majorica/app/components/extensions.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  const ReservationCard({
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      onTap: () => Get.toNamed(
        Routes.RESERVATION_DETAILS,
        arguments: reservation,
      ),
      elevation: 0.0,
      borderRadius: AppUtil.borderRadius25,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ),
      color: ColorUtil.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Text(
                    '#${reservation.iD!}',
                    style: AppUtil.textStyle(
                      fontSize: 44.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.errorColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      reservation.statusText!,
                      style: AppUtil.textStyle(
                        fontSize: 44.sp,
                        fontWeight: FontWeight.bold,
                        color: AppUtil.fromHex(reservation.statusColor!),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                reservation.roomType!,
                style: AppUtil.textStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtil.darkBlue,
                ),
              ),
            ),
            if (reservation.checkIn != null && reservation.checkOut != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ResInfoItem(
                        title: S.of(context).checkIn,
                        info: reservation.checkIn!.toDayMonthOnly(),
                      ),
                    ),
                    Expanded(
                      child: ResInfoItem(
                        title: S.of(context).checkOut,
                        info: reservation.checkOut!.toDayMonthOnly(),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ResInfoItem(
                      title: S.of(context).packages,
                      info: reservation.roomPackage!,
                    ),
                  ),
                  if (reservation.offerName != null)
                    Expanded(
                      child: ResInfoItem(
                        title: S.of(context).offer,
                        info: reservation.offerName!,
                      ),
                    ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.sp),
                  child: FDottedLine(
                    color: ColorUtil.mediumGrey,
                    width: Get.width,
                    strokeWidth: 2.0,
                    dottedLength: 20.sp,
                    space: 2.0,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: -50.sp,
                  child: CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: ColorUtil.lightGrey,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: -50.sp,
                  child: CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: ColorUtil.lightGrey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Text(
                    S.of(context).total,
                    style: AppUtil.textStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.darkBlue,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${reservation.reservationTotal} ${S.of(context).egp}',
                    style: AppUtil.textStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.errorColor,
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
