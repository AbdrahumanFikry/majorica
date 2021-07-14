import 'package:get/get.dart';
import 'package:majorica/app/data/models/available_room.dart';
import 'package:majorica/app/data/models/room_group.dart';
import 'package:majorica/app/modules/available_rooms/views/available_rooms_reselt_view.dart';
import 'package:majorica/app/modules/root/controllers/root_controller.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:majorica/app/components/extensions.dart';

class AvailableRoomsController extends GetxController with BusyMixin, ApiMixin {
  final _roomGroupsFromCache = RxList<RoomGroup>(<RoomGroup>[]);

  final availableRoomGroups = RxList<RoomGroup>(<RoomGroup>[]);

  DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  final startDateTime = Rx<DateTime>(DateTime.now());
  final endDateTime = Rx<DateTime>(
    DateTime.now().add(
      const Duration(days: 1),
    ),
  );

  static AvailableRoomsController get to =>
      Get.find<AvailableRoomsController>();

  Future<void> fetchRooms() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.checkDate,
        body: {
          "sessionID": sessionID,
          "fromDate": startDateTime.value.toShortUserString(),
          "toDate": endDateTime.value.toShortUserString(),
        },
      );
      if (response['avbRooms'] != null) {
        availableRoomGroups.clear();
        final Map<String, dynamic>? rooms = response['avbRooms'];
        if (rooms?.entries != null) {
          for (final room in rooms!.entries) {
            final int? groupID = int.tryParse(room.key);
            final AvailableRoomDetails availableRoomDetails =
                AvailableRoomDetails.fromJson(room.value);
            final RoomGroup availableRoom = _roomGroupsFromCache.firstWhere(
              (element) => element.groupId == groupID,
            );
            availableRoom.price = availableRoomDetails.price;
            availableRoom.count = availableRoomDetails.count;
            availableRoom.startDate = startDateTime.value;
            availableRoom.endDate = endDateTime.value;
            availableRoomGroups.add(availableRoom);
          }
          startDateTime(DateTime.now());
          endDateTime(DateTime.now().add(const Duration(days: 1)));
          dateRangePickerController.selectedRange = PickerDateRange(
            startDateTime.value,
            endDateTime.value,
          );
          Get.to(() => AvailableRoomsResultsView());
        }
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    String? range;
    if (args.value is PickerDateRange) {
      range =
          '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} - ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      startDateTime(args.value.startDate);
      endDateTime(args.value.endDate ?? args.value.startDate);
    } else if (args.value is DateTime) {
      range = args.value.toString();
      startDateTime(args.value);
      endDateTime(args.value);
    }
    print(range);
  }

  @override
  void onReady() {
    _roomGroupsFromCache.assignAll(
      RootController.to.appData.value!.roomGroups!.toList(),
    );
    super.onReady();
  }
}
