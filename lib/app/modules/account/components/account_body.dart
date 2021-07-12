import 'package:flutter/material.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/account/components/account_card.dart';
import 'package:majorica/app/modules/account/controllers/account_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:get/get.dart';

class AccountBody extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      color: ColorUtil.whiteColor,
      elevation: 10.0,
      child: AnimatedListHandler(
        shrinkWrap: true,
        disableGlow: true,
        children: [
          // AccountCard(
          //   iconData: Icons.pending_actions_rounded,
          //   title: S.of(context).pending,
          //   onTap: () => Get.toNamed(Routes.PENDINGS),
          //   trailing: '1',
          // ),
          AccountCard(
            iconData: Icons.language,
            title: S.of(context).language,
            onTap: () => controller.changeLanguage(context),
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
          ),
          AccountCard(
            iconData: Icons.call_outlined,
            title: S.of(context).contactUs,
          ),
          AccountCard(
            iconData: Icons.info_outline,
            title: S.of(context).termsOfService,
          ),
          AccountCard(
            iconData: Icons.star_border_outlined,
            title: S.of(context).rateUsOnStore,
          ),
          AccountCard(
            iconData: Icons.power_settings_new_rounded,
            title: S.of(context).signOut,
            onTap: () async {
              // await CacheService.to.userRepo.signOutAndRemoveSessionID();
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
