import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/empty_widget.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/loading.dart';
import 'package:majorica/app/modules/available_rooms/components/room_card.dart';
import 'package:majorica/app/modules/available_rooms/controllers/available_rooms_controller.dart';
import 'package:majorica/generated/l10n.dart';

class AvailableRoomsResultsView extends GetView<AvailableRoomsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).availableRooms,
        enableBack: true,
      ),
      body: Obx(
        () {
          final rooms = AvailableRoomsController.to.availableRoomGroups;
          if (controller.isBusy.value) {
            return Loading();
          } else {
            if (rooms.isEmpty) {
              return EmptyWidget(
                hint: S.of(context).noRooms,
              );
            } else {
              return AnimatedListHandler(
                children: rooms
                    .map(
                      (room) => RoomCard(
                        room: room,
                      ),
                    )
                    .toList(),
              );
            }
          }
        },
      ),
    );
  }
}
