import 'package:get/get.dart';
import 'package:majorica/app/modules/account/controllers/account_controller.dart';
import 'package:majorica/app/modules/home/controllers/home_controller.dart';
import 'package:majorica/app/modules/reservations/controllers/reservations_controller.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(
      RootController(),
      permanent: true,
    );
    Get.lazyPut<ReservationsController>(
      () => ReservationsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
