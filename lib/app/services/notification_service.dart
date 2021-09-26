import 'dart:convert';

import 'package:bdaya_fcm_handler/bdaya_fcm_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:majorica/app/modules/home/controllers/home_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';

class NotificationService extends GetxService {
  void handleMessages(NotificationSource src, RemoteMessage? message) {
    if (message != null) {
      final data = message.data.entries.first;
      print(message.notification.toString());
      print(data);
      if (data.key == 'updateHome' && data.value == 'true') {
        HomeController.to.fetchHomeData();
      }
      if (message.notification != null) {
        AppUtil.showAlertSnack(
          title: message.notification!.title,
          body: message.notification!.body,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  void init() {
    if (Get.isRegistered<FCMService>()) {
      Get.find<FCMService>().registerSubscriber(handleMessages);
    }
  }
}
