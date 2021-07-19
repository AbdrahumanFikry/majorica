import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/account/components/account_card.dart';
import 'package:majorica/app/modules/account/controllers/account_controller.dart';
import 'package:majorica/app/modules/account/views/terms_of_service.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/modules/root/controllers/root_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/services/cache_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'account_card.dart';

class AccountBody extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GlobalCard(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        color: ColorUtil.whiteColor,
        elevation: 10.0,
        child: Obx(
          () {
            final appSettings = RootController.to.appData.value!.appSettings!;
            String link = appSettings.appLinks!.androidStore!;
            if (Platform.isAndroid) {
              link = appSettings.appLinks!.androidStore!;
            } else {
              link = appSettings.appLinks!.appleStore!;
            }
            return AnimatedListHandler(
              shrinkWrap: true,
              disableGlow: true,
              children: [
                AccountCard(
                  iconData: Icons.language,
                  title: S.of(context).language,
                  onTap: () => controller.changeLanguage(context),
                ),
                AccountCard(
                  iconData: CupertinoIcons.collections_solid,
                  title: S.of(context).documents,
                  onTap: () => Get.toNamed(Routes.DOCUMENTS),
                ),
                AccountCard(
                  iconData: Icons.lock_outline_rounded,
                  title: S.of(context).changePassword,
                  onTap: () {
                    AuthService.to.changePassword(true);
                    Get.toNamed(Routes.RESET_PASSWORD);
                  },
                ),
                AccountCard(
                  iconData: Icons.share,
                  title: S.of(context).inviteFriends,
                  onTap: () async {
                    await Share.share(link, subject: 'Discover MAJORICA APP');
                  },
                ),
                AccountCard(
                  iconData: Icons.call_outlined,
                  title: S.of(context).contactUs,
                  onTap: () async {
                    try {
                      if (await canLaunch(
                          'tel://${appSettings.contactUs!.first}')) {
                        await launch('tel://${appSettings.contactUs!.first}');
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
                AccountCard(
                  iconData: Icons.info_outline,
                  title: S.of(context).termsOfService,
                  onTap: () =>
                      Get.to(() => TOS(tOSLink: appSettings.appLinks!.tOS!)),
                ),
                AccountCard(
                  iconData: Icons.star_border_outlined,
                  title: S.of(context).rateUsOnStore,
                  onTap: () async {
                    try {
                      if (await canLaunch(link)) {
                        await launch(link);
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
                AccountCard(
                  iconData: Icons.power_settings_new_rounded,
                  title: S.of(context).signOut,
                  onTap: () async {
                    PendingsController.to.pendingList.clear();
                    await CacheService.to.userRepo.clear();
                    Get.offAllNamed(Routes.ACCOUNT);
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
