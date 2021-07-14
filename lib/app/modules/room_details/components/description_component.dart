import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/room_details/controllers/room_details_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class RoomDescription extends GetView<RoomDetailsController> {
  @override
  Widget build(BuildContext context) {
    return controller.roomData.value?.desc == null
        ? const SizedBox.shrink()
        : GlobalCard(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).description,
                    style: AppUtil.textStyle(
                      fontSize: 60.sp,
                      color: ColorUtil.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    controller.roomData.value!.desc!,
                    style: AppUtil.textStyle(
                      fontSize: 48.sp,
                      color: ColorUtil.mediumGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
