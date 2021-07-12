import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';

class AccountCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;
  final String? trailing;

  const AccountCard({
    required this.iconData,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppUtil.textStyle(
                      color: ColorUtil.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.sp,
                    ),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(
                    width: 10.0,
                  ),
                  CircleAvatar(
                    radius: 30.sp,
                    backgroundColor: ColorUtil.errorColor,
                    child: FittedBox(
                      child: Text(
                        trailing!,
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  iconData,
                  color: ColorUtil.mediumGrey,
                  size: 75.sp,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: ColorUtil.mediumGrey,
          height: 2.0,
        )
      ],
    );
  }
}
