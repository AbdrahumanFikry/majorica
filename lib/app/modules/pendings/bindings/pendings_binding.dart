import 'package:get/get.dart';

import '../controllers/pendings_controller.dart';

class PendingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendingsController>(
      () => PendingsController(),
    );
  }
}
