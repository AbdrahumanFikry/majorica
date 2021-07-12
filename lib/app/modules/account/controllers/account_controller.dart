import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_builder.dart';
import 'package:majorica/app/utilities/app_util.dart';

class AccountController extends GetxController {
  Future<void> changeLanguage(BuildContext context) async {
    final String? currentLang = await AppUtil.languageSelection();
    if (currentLang != null) {
      // await CacheService.to.settingsRepo.setCachedLang(currentLang);
      AppBuilder.of(context)!.rebuild();
    }
  }
}
