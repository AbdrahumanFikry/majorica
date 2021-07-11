import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/modules/available_rooms/views/available_rooms_reselt_view.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';

class AvailableRoomsController extends GetxController with BusyMixin, ApiMixin {
  GlobalKey<FormState> filterFormKey = GlobalKey<FormState>();
  TextEditingController startDate = TextEditingController();
  late final DateTime startDateTime;
  TextEditingController endDate = TextEditingController();
  TextEditingController operation = TextEditingController();

  Future<void> fetchRooms() async {
    final formData = filterFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      Get.to(() => AvailableRoomsResultsView());
    }
  }
}
