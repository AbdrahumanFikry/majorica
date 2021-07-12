import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/account/components/account_body.dart';

import '../components/header.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AccountHeader(),
          ),
          Positioned(
            top: Get.height * 0.25,
            left: 0.0,
            right: 0.0,
            child: AccountBody(),
          ),
        ],
      ),
    );
  }
}
