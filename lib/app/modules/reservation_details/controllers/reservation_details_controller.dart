import 'package:get/get.dart';
import 'package:majorica/app/data/models/all_reservations.dart';
import 'package:majorica/app/modules/reservations/controllers/reservations_controller.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';

class ReservationDetailsController extends GetxController
    with BusyMixin, ApiMixin {
  final dynamic data;
  final reservationDetails = Rxn<Reservation>();

  ReservationDetailsController(this.data);

  Future<void> cancelReservation() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.cancelReservation,
        body: {
          "sessionID": sessionID,
          "resvID": reservationDetails.value!.iD,
        },
      );
      if (response['success'] == true) {
        reservationDetails.value!.statusText = 'Canceled';
        reservationDetails.value!.refundable = '';
        ReservationsController.to.allReservations.value!.upComming!.removeWhere(
          (res) => res.iD == reservationDetails.value!.iD,
        );
        ReservationsController.to.allReservations.value!.upComming!.add(
          reservationDetails.value!,
        );
        Get.back();
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  @override
  void onReady() {
    if (data != null) {
      reservationDetails(data);
    }
    super.onReady();
  }
}
