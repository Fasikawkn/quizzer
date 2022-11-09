import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.child,this.marginBottom}) : super(key: key);
  final Widget child;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: marginBottom?? 0.0
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEDF3F6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
