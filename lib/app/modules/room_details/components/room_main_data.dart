import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/room_details/components/period_component.dart';
import 'package:majorica/app/modules/room_details/controllers/room_details_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class RoomMainData extends GetView<RoomDetailsController> {
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
                    controller.roomData.value?.name ?? '',
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
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${controller.roomData.value?.price ?? '-'} ${S.of(context).egp}',
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
            if (controller.roomData.value?.startDate != null &&
                controller.roomData.value?.endDate != null)
              PeriodComponent(
                startDate: controller.roomData.value!.startDate!,
                endDate: controller.roomData.value!.endDate!,
              ),
          ],
        ),
      ),
    );
  }
}
