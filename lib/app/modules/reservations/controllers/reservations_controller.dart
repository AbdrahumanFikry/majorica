import 'package:get/get.dart';
import 'package:majorica/app/data/models/all_reservations.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';

class ReservationsController extends GetxController with BusyMixin, ApiMixin {
  final reservationType = 'UpComing'.obs;
  final allReservations = Rxn<MyReservations>();

  static ReservationsController get to => Get.find();

  List<Reservation>? get reservations {
    if (reservationType.value == 'Past') {
      return allReservations.value!.past ?? <Reservation>[];
    } else {
      return allReservations.value!.upComming ?? <Reservation>[];
    }
  }

  Future<void> fetchMyReservations() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.myReservations,
        body: {
          "sessionID": sessionID,
        },
      );
      if (response['myReservations'] != null) {
        allReservations(MyReservations.fromJson(response['myReservations']));
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }
}
