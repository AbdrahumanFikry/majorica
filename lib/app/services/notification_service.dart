import 'package:bdaya_fcm_handler/bdaya_fcm_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:majorica/app/utilities/app_util.dart';

class NotificationService extends GetxService {
  void handleMessages(NotificationSource src, RemoteMessage message) {
    print(message.notification.toString());
    // var msg = standardSerializers.deserialize(jsonDecode(message.data['*']),
    //     specifiedType: const FullType(SignalRMessageVM)) as SignalRMessageVM;

    // if (controller != null && controller.roomId == msg.chatRoomId) {
    // controller.provideMessage(
    //   (MessageViewModelBuilder()
    //         ..messageId = msg.messageId
    //         ..attachments = msg.attachments.toBuilder()
    //         ..content = msg.content
    //         ..issuedDate = msg.issuedDate
    //         ..issuerName = msg.issuerName
    //         ..issuerId = msg.issuerId
    //         ..isPinned = msg.isPinned
    //         ..selfOrOther = msg.selfOrOther)
    //       .build(),
    // );
    // } else {
    // void doNav() {
    //   Get.toNamed(
    //     Routes.CHAT,
    //     arguments: ChatRouteInputs(
    //       roomId: msg.chatRoomId,
    //       projectId: msg.projectId,
    //       roomName: S.current.roomName,
    //     ),
    //   );
    // }

    // if (src != NotificationSource.OnMessageOpenedApp) {
    AppUtil.showAlertSnack(
      title: message.notification!.title,
      body: message.notification!.body,
      snackPosition: SnackPosition.TOP,
    );
  }

  void init() {
    if (Get.isRegistered<FCMService>()) {
      Get.find<FCMService>().registerSubscriber(handleMessages);
    }
  }
}
