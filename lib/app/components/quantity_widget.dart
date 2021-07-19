import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';

class QuantityWidget extends StatelessWidget {
  final Function()? incrementFunc;
  final Function()? decrementFunc;
  final int amount;
  final bool readOnly;

  const QuantityWidget({
    required this.amount,
    this.decrementFunc,
    this.incrementFunc,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtil.primaryColor,
        borderRadius: AppUtil.borderRadius10,
        border: Border.all(
          color: ColorUtil.primaryColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!readOnly)
            GestureDetector(
              onTap: incrementFunc,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 7.0,
                ),
                child: Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              color: ColorUtil.whiteColor,
              borderRadius: AppUtil.borderRadius10,
              border: Border.all(
                color: ColorUtil.primaryColor,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 7.0,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 3.0,
            ),
            child: FittedBox(
              child: Text(
                amount.toString(),
                style: AppUtil.textStyle(
                  color: ColorUtil.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 50.sp,
                ),
              ),
            ),
          ),
          if (!readOnly)
            GestureDetector(
              onTap: decrementFunc,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 7.0,
                ),
                child: Icon(
                  CupertinoIcons.minus,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
