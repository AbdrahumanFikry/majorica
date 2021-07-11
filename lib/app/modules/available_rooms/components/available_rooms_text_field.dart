import 'package:flutter/material.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/validators.dart';

class AvailableRoomsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData iconData;
  final Function() onTap;

  const AvailableRoomsTextField(
    this.controller, {
    required this.labelText,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller,
      labelText: labelText,
      readOnly: true,
      underLine: false,
      borderColor: ColorUtil.darkBlue,
      textColor: ColorUtil.darkBlue,
      validator: const QuickTextValidator(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      prefixWidget: Icon(
        iconData,
        color: ColorUtil.darkBlue,
        size: 20.0,
      ),
      onTap: onTap,
    );
  }
}
