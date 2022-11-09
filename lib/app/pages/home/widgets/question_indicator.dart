import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionIndicator extends StatelessWidget {
  const QuestionIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          right: 3.w,
        ),
        height: 2.5.h,
        color: color,
      ),
    );
  }
}
