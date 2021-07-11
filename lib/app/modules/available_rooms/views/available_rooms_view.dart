import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/extensions.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/available_rooms/components/available_rooms_text_field.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/available_rooms_controller.dart';

class AvailableRoomsView extends GetView<AvailableRoomsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).reserveRoom,
        enableBack: true,
      ),
      body: Form(
        key: controller.filterFormKey,
        child: AnimatedListHandler(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).choosePeriod,
                style: AppUtil.textStyle(
                  fontSize: 55.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            AvailableRoomsTextField(
              controller.startDate,
              labelText: S.of(context).startDate,
              iconData: CupertinoIcons.calendar_badge_plus,
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                if (!controller.isBusy.value) {
                  controller.startDateTime = (await AppUtil.chooseDateTime(
                    mode: CupertinoDatePickerMode.date,
                  ))!;
                  controller.startDate.text =
                      controller.startDateTime.toShortUserString();
                }
              },
            ),
            AvailableRoomsTextField(
              controller.endDate,
              labelText: S.of(context).endDate,
              iconData: CupertinoIcons.calendar_badge_plus,
              onTap: () async {
                if (controller.startDate.text.isEmpty) {
                  AppUtil.showAlertDialog(
                    contentText: S.of(context).startDateNull,
                  );
                } else if (!controller.isBusy.value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final result = (await AppUtil.chooseDateTime(
                    mode: CupertinoDatePickerMode.date,
                  ))!;
                  if (result.isBefore(controller.startDateTime)) {
                    AppUtil.showAlertDialog(
                      contentText: S.of(context).endDateValidation,
                    );
                  } else {
                    controller.endDate.text = result.toShortUserString();
                  }
                }
              },
            ),
            AppButton(
              isBusy: controller.isBusy.value,
              title: S.of(context).confirm,
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0,
              ),
              onTap: controller.fetchRooms,
            ),
          ],
        ),
      ),
    );
  }
}
