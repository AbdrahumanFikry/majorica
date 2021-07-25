import 'package:get/get.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/services/analytics_service.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<AnalyticsService>(
    //   AnalyticsService(),
    //   permanent: true,
    // );
    Get.put<PendingsController>(
      PendingsController(),
      permanent: true,
    );
  }
}
