import 'package:flutter/material.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final bool hidePassword;
  final bool isPassword;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final int maxLines;
  final TextAlign textAlignment;
  final TextInputType keyBoardType;
  final double fontSize;
  final Function()? changeObscuring;
  final bool autoFocus;
  final String? initialValue;
  final EdgeInsets? margin;
  final String? labelText;
  final bool underLine;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final Function()? onTap;

  const AppTextField(
    this.controller, {
    this.autoFocus = true,
    this.hidePassword = false,
    this.isPassword = false,
    this.prefixWidget,
    this.suffixWidget,
    this.initialValue,
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.onChanged,
    this.hintText = '',
    this.textAlignment = TextAlign.start,
    this.keyBoardType = TextInputType.text,
    this.fontSize = 16,
    this.changeObscuring,
    this.readOnly = false,
    this.underLine = true,
    this.maxLines = 1,
    this.margin,
    this.labelText,
    this.borderRadius,
    this.borderColor,
    this.hintColor,
    this.textColor,
    this.focusNode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: margin ?? const EdgeInsets.symmetric(vertical: 2.5),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            readOnly: readOnly,
            textAlign: textAlignment,
            initialValue: initialValue,
            textInputAction: TextInputAction.done,
            cursorColor: ColorUtil.primaryColor,
            keyboardType: keyBoardType,
            maxLines: maxLines,
            obscureText: hidePassword,
            onFieldSubmitted: onFieldSubmitted?.call,
            onSaved: onSaved?.call,
            style: TextStyle(
              color: textColor ?? ColorUtil.blackColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
            focusNode: focusNode,
            decoration: InputDecoration(
              filled: true,
              fillColor: underLine ? Colors.transparent : ColorUtil.lightGrey,
              labelText: labelText,
              labelStyle: AppUtil.textStyle(
                fontSize: 15.0,
                color: borderColor ?? ColorUtil.primaryColor,
                fontWeight: FontWeight.w600,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 12.0,
                color: hintColor ?? ColorUtil.lightGrey,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: maxLines > 1 ? 10.0 : 0.0,
                horizontal: 15.0,
              ),
              prefixIcon: prefixWidget == null
                  ? null
                  : SizedBox(
                      width: 200.sp,
                      child: Center(
                        child: prefixWidget,
                      ),
                    ),
              suffix: suffixWidget == null && !isPassword
                  ? null
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: suffixWidget ??
                          (isPassword
                              ? GestureDetector(
                                  onTap: changeObscuring,
                                  child: Icon(
                                    !hidePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 16.0,
                                    color: borderColor ?? ColorUtil.darkBlue,
                                  ),
                                )
                              : null),
                    ),
              alignLabelWithHint: true,
              enabledBorder: underLine
                  ? AppUtil.underLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    )
                  : AppUtil.outLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    ),
              disabledBorder: underLine
                  ? AppUtil.underLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    )
                  : AppUtil.outLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    ),
              focusedBorder: underLine
                  ? AppUtil.underLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    )
                  : AppUtil.outLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    ),
              border: underLine
                  ? AppUtil.underLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    )
                  : AppUtil.outLineInputBorder(
                      color: borderColor,
                      borderRadius: borderRadius,
                    ),
              errorBorder: underLine
                  ? AppUtil.errorUnderLineInputBorder(
                      borderRadius: borderRadius)
                  : AppUtil.errorOutLineInputBorder(borderRadius: borderRadius),
              errorStyle: AppUtil.textStyle(
                color: ColorUtil.errorColor,
              ),
            ),
          ),
        ),
        if (onTap != null)
          Positioned.fill(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
      ],
    );
  }
}
