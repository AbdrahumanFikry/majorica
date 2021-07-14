import 'package:get/get.dart';
import 'package:majorica/app/data/models/app_data.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/services/cache_service.dart';

class RootController extends GetxController {
  final currentPage = 0.obs;
  final appData = Rxn<AppData>();

  static RootController get to => Get.find<RootController>();

  @override
  void onReady() {
    CacheService.to.appDataRepo.firstEntryStream().listen(
      (event) async {
        if (event != null) {
          appData(event.value);
        }
      },
    ).onDone(() {
      if (appData.value == null) {
        AuthService.to.loadApp(
          localSession: AuthService.to.currentUser.value!.sessionID,
        );
      }
    });
    super.onReady();
  }
}
