import 'package:get/get.dart';

import '../app_util.dart';

mixin BusyMixin {
  final isBusy = false.obs;
  final busyId = RxString('-1');
  final errorMessage = RxString('');

  bool get hasError => errorMessage.value.isNotEmpty;

  void startBusy() {
    isBusy(true);
    errorMessage(null);
  }

  void startBusyWithId(String id) {
    busyId(id);
    errorMessage(null);
  }

  void endBusySuccess() {
    isBusy(false);
    busyId('-1');
    errorMessage('');
  }

  void endBusyError(Object error, {bool? showDialog}) {
    isBusy(false);
    busyId('-1');
    final String message = error is String ? error : error.toString();
    errorMessage(message);
    if (showDialog == true) {
      AppUtil.showAlertDialog(
        contentText: message,
      );
    }
  }
}
