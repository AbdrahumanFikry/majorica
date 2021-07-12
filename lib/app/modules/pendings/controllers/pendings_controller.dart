import 'package:get/get.dart';
import 'package:majorica/app/modules/pendings/views/payment_view.dart';

class PendingsController extends GetxController {
  Future<void> confirmReservation() async {
    final result = Get.to(
      () => Payment(),
    );
  }
}
