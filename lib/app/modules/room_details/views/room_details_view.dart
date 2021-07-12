import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/room_details/components/description_component.dart';
import 'package:majorica/app/modules/room_details/components/images_view.dart';
import 'package:majorica/app/modules/room_details/components/participants.dart';
import 'package:majorica/app/modules/room_details/components/room_main_data.dart';
import 'package:majorica/app/modules/room_details/components/room_packages.dart';
import 'package:majorica/app/modules/room_details/components/rooms_count.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';
import '../controllers/room_details_controller.dart';

class RoomDetailsView extends GetView<RoomDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: ImagesView(),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            bottom: 0.0,
            child: SafeArea(
              child: AnimatedListHandler(
                shrinkWrap: true,
                disableGlow: true,
                children: [
                  SizedBox(
                    height: Get.height * 0.35,
                  ),
                  Lottie.asset(
                    PathUtil.upLottie,
                    height: Get.height * 0.15,
                    width: Get.height * 0.15,
                  ),
                  RoomMainData(),
                  RoomDescription(),
                  RoomPackages(),
                  RoomParticipants(),
                  RoomCount(),
                  AppButton(
                    isBusy: controller.isBusy.value,
                    onTap: controller.reserve,
                    height: 200.sp,
                    borderRadius: AppUtil.borderRadius25,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).reserveNow,
                          style: AppUtil.textStyle(
                            fontSize: 48.sp,
                            color: ColorUtil.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '1800 ${S.of(context).egp}',
                          style: AppUtil.textStyle(
                            fontSize: 60.sp,
                            color: ColorUtil.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150.sp,
            right: !AppUtil.isLtr ? 0.0 : null,
            left: AppUtil.isLtr ? 0.0 : null,
            child: GlobalCard(
              color: Colors.black54,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: ColorUtil.whiteColor,
                  size: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
