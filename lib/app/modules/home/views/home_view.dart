import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/modules/root/controllers/root_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../components/room_info_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: FutureBuilder(
        future: controller.fetchHomeData(),
        builder: (context, snapShot) => Obx(
          () {
            final wallpaper = RootController.to.wallpaper.value;
            return Stack(
              children: [
                if (wallpaper == null)
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
                    wallpaper,
                    height: Get.height,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                Positioned(
                  top: 150.sp,
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: SafeArea(
                    child: Column(
                      children: [
                        GlobalCard(
                          color: ColorUtil.whiteColor,
                          elevation: 10.0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          onTap: () async {
                            final range = await Get.dialog<DateTimeRange>(
                              Theme(
                                data: ThemeData(
                                  textButtonTheme: TextButtonThemeData(
                                    style: ButtonStyle(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
                                        const Size(150.0, 150.0),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        AppUtil.textStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(
                                        const Size(150.0, 150.0),
                                      ),
                                    ),
                                  ),
                                  buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.accent,
                                  ),
                                  primaryColor: ColorUtil.primaryColor,
                                ),
                                child: DateRangePickerDialog(
                                  // context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                  helpText: S.of(context).choosePeriod,
                                  cancelText: S.of(context).cancel,
                                  confirmText: S.of(context).confirm,
                                  saveText: S.of(context).confirm,
                                  fieldStartHintText: S.of(context).startDate,
                                  fieldEndHintText: S.of(context).endDate,
                                  fieldStartLabelText: S.of(context).startDate,
                                  fieldEndLabelText: S.of(context).endDate,
                                  // initialDateRange: controller.range.value,
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                ),
                              ),
                            );
                            if (range != null) {
                              controller.range(range);
                              Get.toNamed(
                                Routes.AVAILABLE_ROOMS,
                                arguments: range,
                              );
                            }
                          },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).reserveRoom,
                                        style: AppUtil.textStyle(
                                          fontSize: 45.sp,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
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
                        if (controller.homeData.value?.myRooms != null &&
                            controller.homeData.value!.myRooms!.isNotEmpty)
                          Expanded(
                            child: AnimatedListHandler(
                              children: [
                                // if (controller.payAvailable.value)
                                GlobalCard(
                                  color: ColorUtil.whiteColor,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10.0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      S.of(context).payDebt,
                                    ),
                                  ),
                                ),
                                ...controller.homeData.value!.myRooms!
                                    .map(
                                      (room) => RoomInfoView(
                                        roomInfo: room,
                                        requests:
                                            controller.homeData.value!.requests,
                                        wiFiName:
                                            controller.homeData.value!.wiFiName,
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
