import 'package:get/get.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/generated/l10n.dart';

class RoomDetailsController extends GetxController with BusyMixin, ApiMixin {
  final currentAdIndex = 0.obs;

  Future<void> reserve() async {
    await AppUtil.showAlertDialog(
      contentText: S.current.pendingDoneDesc,
      confirmText: S.current.goToPending,
      enableCancel: true,
      onConfirm: () {
        Get.back();
      },
    );
  }
}
