import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
        child: Column(
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
            SfDateRangePicker(
              onSelectionChanged: controller.onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              minDate: DateTime.now().subtract(
                const Duration(days: 1),
              ),
              initialSelectedRange: PickerDateRange(
                DateTime.now(),
                DateTime.now().add(
                  const Duration(days: 1),
                ),
              ),
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
