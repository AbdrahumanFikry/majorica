import 'dart:io';

import 'package:get/get.dart';
import 'package:majorica/app/data/models/document.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/app/utilities/mixins/busy_mixin.dart';
import 'package:majorica/app/utilities/path_util.dart';

class DocumentsController extends GetxController with BusyMixin, ApiMixin {
  final allDocs = RxList<Document>(<Document>[]);
  final docFile = Rx<File>(File(''));

  static DocumentsController get to => Get.find();

  Future<void> fetchAllDocs() async {
    try {
      startBusy();
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.myDocs,
        body: {
          "sessionID": sessionID,
        },
      );
      if (response['myDocs'] != null) {
        allDocs.assignAll(
          AllDocuments.fromJson(response).myDocs!.toList(),
        );
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> uploadDoc() async {
    try {
      startBusyWithId('new');
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.uploadDocs,
        body: {
          "sessionID": sessionID,
          "sessionID": sessionID,
        }..addAll(
            filesToBase64(
              {
                "image": docFile.value,
              },
            ),
          ),
      );
      if (response['success'] == true) {
        docFile(File(''));
        await fetchAllDocs();
        Get.back();
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  Future<void> removeDoc(String? id) async {
    try {
      startBusyWithId(id!);
      final sessionID = AuthService.to.currentUser.value!.sessionID;
      final response = await post(
        ApiUtil.deleteDoc,
        body: {
          "sessionID": sessionID,
          "docID": int.tryParse(id),
        },
      );
      if (response['success'] == true) {
        allDocs.removeWhere((element) => element.iD == id);
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(error, showDialog: true);
    }
  }

  @override
  void onReady() {
    fetchAllDocs();
    super.onReady();
  }
}
