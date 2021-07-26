import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/waiting.dart';
import 'package:majorica/app/data/models/home_data.dart';
import 'package:majorica/app/modules/home/controllers/home_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../../../components/animated_list_handler.dart';

enum ContainerState {
  Shrink,
  Expanded,
}

class RoomInfoView extends StatefulWidget {
  final RoomInfo? roomInfo;
  final String? wiFiName;
  final Map<String, dynamic>? requests;

  const RoomInfoView({
    this.roomInfo,
    this.requests,
    this.wiFiName,
  });

  @override
  _RoomInfoViewState createState() => _RoomInfoViewState();
}

class _RoomInfoViewState extends State<RoomInfoView> {
  double? containerHeight = 80.0;
  ContainerState containerState = ContainerState.Shrink;

  void changeContainerState() {
    setState(() {
      if (containerState == ContainerState.Shrink) {
        containerHeight = Get.height * 0.5;
        containerState = ContainerState.Expanded;
      } else {
        containerHeight = null;
        containerState = ContainerState.Shrink;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      duration: const Duration(milliseconds: 750),
      child: Column(
        children: [
          GlobalCard(
            onTap: () {
              if (widget.roomInfo?.requestable == true) {
                changeContainerState();
              }
            },
            color: ColorUtil.whiteColor,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (widget.roomInfo?.requestable == true)
                        Text(
                          '${S.of(context).roomNum} : ${widget.roomInfo!.roomNumber!}',
                          style: AppUtil.textStyle(
                            fontSize: 44.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.errorColor,
                          ),
                        ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (widget.roomInfo?.status != null)
                        Expanded(
                          child: Text(
                            widget.roomInfo!.status!,
                            style: AppUtil.textStyle(
                              fontSize: 44.sp,
                              fontWeight: FontWeight.bold,
                              color: AppUtil.fromHex(
                                  widget.roomInfo!.statusColor!),
                            ),
                            textAlign: widget.roomInfo?.requestable == true
                                ? TextAlign.end
                                : TextAlign.start,
                          ),
                        ),
                      if (widget.roomInfo?.requestable != true) ...[
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Text(
                            '${S.of(context).resNum} : ${widget.roomInfo!.iD!}',
                            style: AppUtil.textStyle(
                              fontSize: 44.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorUtil.errorColor,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                      if (widget.roomInfo?.dND == true)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                          ),
                          child: Icon(
                            CupertinoIcons.moon_fill,
                            size: 75.sp,
                            color: ColorUtil.darkBlue,
                          ),
                        ),
                      if (widget.roomInfo?.requestable == true)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                          ),
                          child: Icon(
                            containerState == ContainerState.Expanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            size: 34.0,
                            color: ColorUtil.primaryColor,
                          ),
                        ),
                    ],
                  ),
                  if (containerState == ContainerState.Expanded)
                    AnimatedListHandler(
                      shrinkWrap: true,
                      noScroll: true,
                      disableGlow: true,
                      children: [
                        Obx(
                          () => Waiting(
                            loading: HomeController.to.busyId.value == 'DND',
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      S.of(context).dND,
                                      style: AppUtil.textStyle(
                                        fontSize: 44.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorUtil.darkBlue,
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: widget.roomInfo!.dND == true,
                                    onChanged: (val) async =>
                                        await HomeController.to.requestDND(
                                      widget.roomInfo!.iD!,
                                      currentDND: val,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (widget.wiFiName != null)
                          AppButton(
                            height: 90.sp,
                            title: 'WIFI',
                            onTap: () async => AppUtil.showAlertDialog(
                              confirmText: S.of(context).done,
                              // enableCancel: true,
                              title:
                                  '${S.of(context).networkName} (${widget.wiFiName})',
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${S.of(context).username} : ${widget.roomInfo!.iD!}',
                                          style: TextStyle(
                                            color: ColorUtil.blackColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 40.sp,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text: widget.roomInfo!.iD,
                                            ),
                                          );
                                          AppUtil.showAlertSnack(
                                            body:
                                                S.of(context).copiedToClipboard,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.copy_rounded,
                                          color: ColorUtil.mediumGrey,
                                          size: 26.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${S.of(context).password} : ${widget.roomInfo!.wifiPassword!} ',
                                          style: TextStyle(
                                            color: ColorUtil.blackColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 40.sp,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text:
                                                  widget.roomInfo!.wifiPassword,
                                            ),
                                          );
                                          AppUtil.showAlertSnack(
                                            body:
                                                S.of(context).copiedToClipboard,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.copy_rounded,
                                          color: ColorUtil.mediumGrey,
                                          size: 26.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (widget.requests?.entries != null)
                          ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            iconColor: ColorUtil.primaryColor,
                            title: Text(
                              S.of(context).services,
                              style: AppUtil.textStyle(
                                fontSize: 44.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.primaryColor,
                              ),
                            ),
                            children: widget.requests!.entries
                                .map(
                                  (e) => Obx(
                                    () => Waiting(
                                      loading: HomeController.to.busyId.value ==
                                          e.key,
                                      margin: EdgeInsets.zero,
                                      child: AppButton(
                                        height: 90.sp,
                                        title: e.value,
                                        backgroundColor: Colors.transparent,
                                        borderColor: ColorUtil.darkBlue,
                                        textColor: ColorUtil.darkBlue,
                                        onTap: () async => await HomeController
                                            .to
                                            .requestService(
                                          widget.roomInfo!.iD!,
                                          e.key,
                                          e.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
