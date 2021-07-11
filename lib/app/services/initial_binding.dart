import 'package:get/get.dart';
import 'package:majorica/app/services/auth_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(
      AuthService(),
    );
  }
}
