import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/modules/root/controllers/root_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final _random = Random();
    return GlobalScaffold(
      body: Obx(
        () {
          final wallpapers =
              RootController.to.appData.value?.appSettings?.appBG?.toList() ??
                  <String>[];
          return Stack(
            children: [
              if (wallpapers.isEmpty)
                Positioned.fill(
                  child: SizedBox(
                    height: Get.width,
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          PathUtil.appIcon,
                          height: 400.sp,
                          width: 400.sp,
                        ),
                      ],
                    ),
                  ),
                )
              else
                NetImage(
                  wallpapers.length > 1
                      ? wallpapers[_random.nextInt(wallpapers.length)]
                      : wallpapers.first,
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              Positioned(
                top: 200.sp,
                left: 0.0,
                right: 0.0,
                child: GlobalCard(
                  color: ColorUtil.whiteColor,
                  elevation: 10.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  onTap: () => Get.toNamed(Routes.AVAILABLE_ROOMS),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          size: 85.sp,
                          color: ColorUtil.blackColor,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).reserveRoom,
                                style: AppUtil.textStyle(
                                  fontSize: 45.sp,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                S.of(context).pressToChooseDate,
                                style: AppUtil.textStyle(
                                  fontSize: 37.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
