import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/data/models/home_data.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

class HomeController extends GetxController with BusyMixin, ApiMixin {
  final range = Rx<DateTimeRange>(
    DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        const Duration(days: 1),
      ),
    ),
  );

  static HomeController get to => Get.find();
  final homeData = Rxn<HomeData>();

  Future<void> fetchHomeData() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.getHome,
        body: {
          "sessionID": sessionID,
        },
      );
      if (response['success'] == true) {
        homeData(HomeData.fromJson(response));
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> requestService(
    String resID,
    String requestId,
    String requestInfo,
  ) async {
    try {
      startBusyWithId(requestId);
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.sendRequest,
        body: {
          "sessionID": sessionID,
          "resvID": resID,
          "type": "request",
          "requestID": int.tryParse(requestId),
        },
      );
      if (response['success'] == true) {
        await AppUtil.showAlertDialog(
          contentText: S.current.requestedService(requestInfo),
        );
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> requestDND(
    String resID, {
    bool currentDND = false,
  }) async {
    try {
      startBusyWithId('DND');
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.sendRequest,
        body: {
          "sessionID": sessionID,
          "resvID": resID,
          "type": "DND",
          "DNDValue": currentDND
        },
      );
      if (response['success'] == true) {
        homeData.update((val) {
          final int index = val!.myRooms!.indexWhere(
            (element) => element.iD == resID,
          );
          val.myRooms![index].dND = !currentDND;
        });
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }
}
