import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:majorica/app/data/models/pending.dart';
import 'package:majorica/app/data/models/room_group.dart';
import 'package:majorica/app/data/models/room_package.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/modules/root/controllers/root_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomDetailsController extends GetxController with BusyMixin, ApiMixin {
  final currentAdIndex = 0.obs;
  final dynamic data;
  final roomData = Rxn<RoomGroup>();
  final sleeps = 1.obs;
  final roomCount = 1.obs;
  final selectedPackage = Rxn<RoomPackage>();
  final roomPackagesFromCache = RxList<RoomPackage>(<RoomPackage>[]);

  RoomDetailsController(this.data);

  double? get total {
    return (roomData.value!.price! +
            (selectedPackage.value!.price! * sleeps.value)) *
        roomCount.value;
  }

  Future<void> reserve() async {
    for (var i = 0; i < roomCount.value; i++) {
      final pending = PendingRoom(
        id: roomData.value!.groupId!,
        name: roomData.value!.name,
        sleeps: sleeps.value,
        image: roomData.value!.images!.isNotEmpty
            ? roomData.value!.images!.first!
            : null,
        total: roomData.value!.price! +
            (selectedPackage.value!.price! * sleeps.value),
        startDate: roomData.value!.startDate,
        endDate: roomData.value!.endDate,
        roomPackage: selectedPackage.value,
      );
      PendingsController.to.pendingList.add(pending);
    }
    await AppUtil.showAlertDialog(
      title: S.current.pendingDoneDesc,
      child: Column(
        children: [
          Lottie.asset(
            PathUtil.pendingLottie,
            width: 300.sp,
            height: 300.sp,
          ),
        ],
      ),
      confirmText: S.current.confirmReservation,
      enableCancel: true,
      onConfirm: () {
        Get.back();
        Get.toNamed(Routes.PENDINGS);
      },
    );
  }

  @override
  void onReady() {
    if (data != null) {
      final RoomGroup? roomGroup = data;
      roomData(roomGroup);
    }
    roomPackagesFromCache.assignAll(
      RootController.to.appData.value!.roomPackages!.toList(),
    );
    selectedPackage(roomPackagesFromCache.first);
    super.onReady();
  }
}
