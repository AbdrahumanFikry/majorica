import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/ticket.dart';
import 'package:majorica/app/data/models/all_reservations.dart';
import 'package:majorica/app/modules/room_details/components/period_component.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  const ReservationCard({
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.RESERVATION_DETAILS,
        arguments: reservation,
      ),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 15.0,
        ),
        child: Ticket(
          color: ColorUtil.lightGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      reservation.roomType!,
                      style: AppUtil.textStyle(
                        fontSize: 44.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.darkBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '#${reservation.iD!}',
                    style: AppUtil.textStyle(
                      fontSize: 44.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.errorColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (reservation.checkIn != null && reservation.checkOut != null)
                PeriodComponent(
                  startDate: reservation.checkIn!,
                  endDate: reservation.checkOut!,
                ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).packages,
                            style: AppUtil.textStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorUtil.blackColor,
                            ),
                          ),
                          Text(
                            reservation.roomPackage!,
                            style: AppUtil.textStyle(
                              fontSize: 38.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (reservation.offerName != null)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).offer,
                              style: AppUtil.textStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.blackColor,
                              ),
                            ),
                            Text(
                              reservation.offerName!,
                              style: AppUtil.textStyle(
                                fontSize: 38.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtil.mediumGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
