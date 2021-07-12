import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/modules/available_rooms/views/available_rooms_reselt_view.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class AvailableRoomsController extends GetxController with BusyMixin, ApiMixin {
  GlobalKey<FormState> filterFormKey = GlobalKey<FormState>();
  final startDateTime = Rxn<DateTime>();
  final endDateTime = Rxn<DateTime>();
  TextEditingController operation = TextEditingController();

  Future<void> fetchRooms() async {
    final formData = filterFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      Get.to(() => AvailableRoomsResultsView());
    }
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    String? range;
    if (args.value is PickerDateRange) {
      range =
          '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} - ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      startDateTime(args.value.startDate);
      endDateTime(args.value.endDate ?? args.value.startDate);
    } else if (args.value is DateTime) {
      range = args.value.toString();
      startDateTime(args.value);
      endDateTime(args.value);
    }
    print(range);
  }
}
