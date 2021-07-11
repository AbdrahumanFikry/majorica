import 'package:flutter/material.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/room_details/components/period_component.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class RoomMainData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.whiteColor,
      elevation: 10.0,
      borderRadius: AppUtil.borderRadius25,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Double room',
                    style: AppUtil.textStyle(
                      fontSize: 60.sp,
                      color: ColorUtil.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                Text(
                  '1500 ${S.of(context).egp}',
                  style: AppUtil.textStyle(
                    fontSize: 60.sp,
                    color: ColorUtil.errorColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            PeriodComponent(
              startDate: DateTime.now().subtract(
                const Duration(days: 3),
              ),
              endDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
