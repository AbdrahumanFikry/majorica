import 'package:get/get.dart';

class RootController extends GetxController {
  final currentPage = 0.obs;
  static RootController get to => Get.find<RootController>();
}
