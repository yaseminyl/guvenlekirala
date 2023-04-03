import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  bool? isActive;
  String? text;
  double width;
  Widget? widget;
  Function()? onPressed;
  TextStyle? textStyle;
  bool? isLoading;
  Color? color;
  Color? borderColor;
  CustomButton({
    Key? key,
    this.isActive,
    this.onPressed,
    this.widget,
    this.text,
    this.textStyle,
    this.isLoading,
    this.color,
    this.borderColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading ?? false || isActive == false) ? () {} : onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width, 50.h)),
        elevation: MaterialStateProperty.all<double>(0.0),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        backgroundColor: color != null ? MaterialStateProperty.all<Color>(color!) : MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
            side: BorderSide(
              color: borderColor ?? color ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      child: isLoading ?? false
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : widget ??
              Text(
                text ?? "",
                style: textStyle,
              ),
    );
  }
}
