import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:majorica/app/components/extensions.dart';
import '../controllers/available_rooms_controller.dart';

class AvailableRoomsView extends GetView<AvailableRoomsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).reserveRoom,
        enableBack: true,
      ),
      body: Obx(
        () => Column(
          children: [
            AppButton(
              title: controller.startDateTime.value != null &&
                      controller.startDateTime.value != null
                  ? '${controller.startDateTime.value!.toDayMonthOnly()} : ${controller.endDateTime.value!.toDayMonthOnly()}'
                  : S.of(context).choosePeriod,
              borderColor: ColorUtil.primaryColor,
              backgroundColor: ColorUtil.whiteColor,
              textColor: ColorUtil.primaryColor,
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0,
              ),
              onTap: () async {
                final range = await Get.dialog<DateTimeRange>(
                  DateRangePickerDialog(
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
                  ),
                );
                if (range != null) {
                  controller.startDateTime(range.start);
                  controller.endDateTime(range.end);
                }
              },
            ),
            if (controller.startDateTime.value != null &&
                controller.startDateTime.value != null)
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
