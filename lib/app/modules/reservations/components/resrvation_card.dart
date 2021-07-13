import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/ticket.dart';
import 'package:majorica/app/modules/room_details/components/period_component.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class ReservationCard extends StatelessWidget {
  final String title;

  const ReservationCard({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.RESERVATION_DETAILS),
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
              Text(
                title,
                style: AppUtil.textStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtil.darkBlue,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              PeriodComponent(
                startDate: DateTime.now(),
                endDate: DateTime.now(),
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
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorUtil.blackColor,
                            ),
                          ),
                          Text(
                            'Bed only',
                            style: AppUtil.textStyle(
                              fontSize: 44.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).offer,
                            style: AppUtil.textStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorUtil.blackColor,
                            ),
                          ),
                          Text(
                            'discount 5%',
                            style: AppUtil.textStyle(
                              fontSize: 44.sp,
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
                      fontSize: 66.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.darkBlue,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '1500 ${S.of(context).egp}',
                    style: AppUtil.textStyle(
                      fontSize: 66.sp,
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
