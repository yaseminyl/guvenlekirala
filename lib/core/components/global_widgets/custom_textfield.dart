import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final TextInputType? inputType;
  final TextCapitalization? capitalization;
  final int? maxLength;
  final double borderRadius;
  final int? maxLines;
  final bool? isRequired;
  final Color? borderColor;
  final TextInputAction? action;
  final bool inlinePadding;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? expands;
  final TextStyle? hintStyle;

  const CustomTextField({
    Key? key,
    this.focusNode,
    this.helperText,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.textAlign,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.inputType,
    this.capitalization,
    this.maxLength,
    this.borderRadius = 8,
    this.maxLines,
    this.isRequired = false,
    this.borderColor,
    this.action,
    this.inlinePadding = false,
    this.readOnly,
    this.expands,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      style: Theme.of(context).textTheme.headline3,
      expands: expands ?? false,
      controller: controller,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.left,
      keyboardType: inputType,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      textInputAction: action,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline4!.copyWith(
              color: ColorConstants.instance.gray,
              fontSize: 14.sp,
            ),
        contentPadding: EdgeInsets.only(
          top: 18.sp,
          bottom: 18.sp,
          left: 15.w,
          right: 15.w,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: ColorConstants.instance.white,
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? Theme.of(context).textTheme.headline3,
        helperStyle: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w500,
              color: ColorConstants.instance.tundora,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(
            color: borderColor ?? ColorConstants.instance.gray,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(
            color: ColorConstants.instance.gray,
          ),
        ),
      ),
    );
  }
}
