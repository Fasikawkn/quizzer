import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/app/constants/text_styles.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.labelColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color? labelColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: backgroundColor ?? Theme.of(context).primaryColor,
        minimumSize: Size(
          322.w,
          60.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.r,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: buttonText.copyWith(
          color: labelColor ?? Colors.white,
        ),
      ),
    );
  }
}
