import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/data/models/room_group.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomCard extends StatelessWidget {
  final RoomGroup room;

  const RoomCard({
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    final _random = Random();
    return GlobalCard(
      onTap: () => Get.toNamed(Routes.ROOM_DETAILS, arguments: room),
      color: ColorUtil.whiteColor,
      borderRadius: AppUtil.borderRadius10,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: room.images == null || room.images!.isEmpty
                ? Image.asset(
                    PathUtil.appIcon,
                    height: 400.sp,
                    width: Get.width,
                    fit: BoxFit.contain,
                  )
                : NetImage(
                    room.images!.length > 1
                        ? room.images![_random.nextInt(room.images!.length)]!
                        : room.images!.first!,
                    height: 400.sp,
                    width: Get.width,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        room.name ?? 'room',
                        style: AppUtil.textStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${room.price ?? '-'} ${S.of(context).egp}',
                      style: AppUtil.textStyle(
                        fontSize: 50.sp,
                        color: ColorUtil.errorColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  room.desc ?? '',
                  style: AppUtil.textStyle(
                    fontSize: 44.sp,
                    color: ColorUtil.mediumGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      room.maxSleeps?.toString() ?? '-',
                      style: AppUtil.textStyle(
                        fontSize: 60.sp,
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Icon(
                      CupertinoIcons.bed_double,
                      color: ColorUtil.primaryColor,
                      size: 80.sp,
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Text(
                        '${S.of(context).available} (${room.count ?? '-'})',
                        style: AppUtil.textStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.primaryColor,
                        ),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
