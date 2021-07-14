import 'package:get/get.dart';

import '../controllers/room_details_controller.dart';

class RoomDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RoomDetailsController>(
      RoomDetailsController(Get.arguments),
    );
  }
}
