import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizCategoryCard extends StatelessWidget {
  const QuizCategoryCard({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xffEDF3F6)),
        child: Column(children: [
          Image.asset(
            image,
            width: 30.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(title)
        ]),
      ),
    );
  }
}
