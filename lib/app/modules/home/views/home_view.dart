import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
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
                            PendingsController.to.showPendingIcon(false);
                            final range = await Get.dialog<DateTimeRange>(
                              Theme(
                                data: ThemeData(
                                  textTheme: TextTheme(
                                    button: AppUtil.textStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: ButtonStyle(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
                                        const Size(150.0, 150.0),
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
                                child: Localizations(
                                  locale: AppUtil.currentLocale,
                                  delegates: const [
                                    S.delegate,
                                    GlobalCupertinoLocalizations.delegate,
                                    GlobalMaterialLocalizations.delegate,
                                    GlobalWidgetsLocalizations.delegate,
                                  ],
                                  child: DateRangePickerDialog(
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    helpText: S.of(context).choosePeriod,
                                    cancelText: S.of(context).cancel,
                                    confirmText: S.of(context).confirm,
                                    saveText: S.of(context).confirm,
                                    fieldStartHintText: S.of(context).startDate,
                                    fieldEndHintText: S.of(context).endDate,
                                    fieldStartLabelText:
                                        S.of(context).startDate,
                                    fieldEndLabelText: S.of(context).endDate,
                                    initialEntryMode:
                                        DatePickerEntryMode.calendarOnly,
                                  ),
                                ),
                              ),
                            );
                            if (PendingsController.to.pendingList.isNotEmpty) {
                              PendingsController.to.showPendingIcon(true);
                            }
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
                                if (controller.payAvailable.value)
                                  AppButton(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 10.0,
                                    ),
                                    title:
                                        '${S.of(context).payDebt} (${controller.amountMustPaid.value} ${S.of(context).egp})',
                                    isBusy: controller.payBalanceLoading.value,
                                    onTap: () async => AppUtil.showAlertDialog(
                                      enableCancel: true,
                                      title: S.of(context).payDebt,
                                      onConfirm: controller.payBalance,
                                      child: Form(
                                        key: controller.payBalanceFormKey,
                                        child: AppTextField(
                                          controller.payAmount,
                                          underLine: false,
                                          readOnly: controller.isBusy.value,
                                          hintText:
                                              S.of(context).enterAmountHere,
                                          hintColor: ColorUtil.mediumGrey,
                                          keyBoardType: TextInputType.number,
                                          margin: const EdgeInsets.all(20.0),
                                          suffixWidget: Text(
                                            S.of(context).egp,
                                            style: AppUtil.textStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorUtil.primaryColor,
                                            ),
                                          ),
                                        ),
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
