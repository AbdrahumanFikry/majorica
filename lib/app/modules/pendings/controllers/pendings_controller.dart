import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:majorica/app/data/models/pending.dart';
import 'package:majorica/app/modules/pendings/views/payment_view.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/app/components/extensions.dart';
import 'package:majorica/generated/l10n.dart';

class PendingsController extends GetxController with BusyMixin, ApiMixin {
  final pendingList = RxList<PendingRoom>(<PendingRoom>[]);
  TextEditingController couponController = TextEditingController();
  final couponApplied = false.obs;

  double? get allTotal {
    double all = 0.0;
    for (final pending in pendingList) {
      if (pending.reserveInfo?.offer != null &&
          pending.reserveInfo?.offer == true) {
        all = all + pending.reserveInfo!.nightsFinalPrice!;
      } else {
        all = all + pending.total!;
      }
    }
    return all;
  }

  static PendingsController get to => Get.find<PendingsController>();

  Future<void> confirmReservation() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.reserve,
        body: {
          "sessionID": sessionID,
          "reservations": pendingList
              .map(
                (pending) => {
                  "groupId": pending.id,
                  "packageId": pending.roomPackage!.packageId,
                  "fromDate": pending.startDate!.toShortUserString(),
                  "toDate": pending.endDate!.toShortUserString(),
                  "sleeps": pending.sleeps,
                },
              )
              .toList(),
          "voucher": couponController.text,
          "confirm": true,
        },
      );
      if (response['paymentToken'] != null) {
        final result = await Get.to(
          () => Payment(
            paymentToken: response['paymentToken'],
          ),
        );
        print(':::::::::::: $result');
        final message = json.decode(result);
        if (message['success'] == true) {
          await AppUtil.showAlertDialog(
            contentText: S.current.paymentDoneSuccessfully,
          );
          pendingList.clear();
          Get.back();
        } else {
          AppUtil.showAlertDialog(
            contentText: '${S.current.paymentError} (${message['error']})',
          );
        }
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> applyCoupon({bool remove = false}) async {
    if (remove) couponController.clear();
    try {
      startBusyWithId('Coupon');
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.reserve,
        body: {
          "sessionID": sessionID,
          "reservations": pendingList
              .map(
                (pending) => {
                  "groupId": pending.id,
                  "packageId": pending.roomPackage!.packageId,
                  "fromDate": pending.startDate!.toShortUserString(),
                  "toDate": pending.endDate!.toShortUserString(),
                  "sleeps": pending.sleeps,
                },
              )
              .toList(),
          "voucher": couponController.text,
          "confirm": false,
        },
      );
      if (response['reserve'] != null) {
        List<ReserveInfo> reserveInfoList = <ReserveInfo>[];
        response['reserve'].forEach(
          (v) {
            final ReserveInfo reserveInfo = ReserveInfo.fromJson(v);
            for (final pending in pendingList) {
              if (pending.id == reserveInfo.groupId) {
                final reserved = pending;
                reserved.reserveInfo = reserveInfo;
                pendingList.remove(pending);
                pendingList.add(reserved);
              }
            }
          },
        );
      }
      couponApplied(!couponApplied.value);
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }
}
