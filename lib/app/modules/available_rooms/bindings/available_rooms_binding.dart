import 'package:get/get.dart';

import '../controllers/available_rooms_controller.dart';

class AvailableRoomsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailableRoomsController>(
      () => AvailableRoomsController(),
    );
  }
}
