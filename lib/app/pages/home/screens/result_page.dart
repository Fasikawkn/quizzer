import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/pages/home/screens/question_page.dart';
import 'package:quiz_app/app/pages/pages.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
  }) : super(key: key);
  final List<String> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141A33),
      appBar: AppBar(
        backgroundColor: const Color(0xff141A33),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Quiz Result',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(
                    'assets/images/winner_cup.png',
                    width: 120.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.sp,
                      letterSpacing: 2.w,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'You have completed all the questions provided!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        letterSpacing: 2.w,
                        height: 1.5),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'YOUR SCORE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        letterSpacing: 4.w,
                        height: 1.5),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${result.first}/',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                          letterSpacing: 6.w,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        result.last,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                          letterSpacing: 6.w,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButton(
                    label: 'Take New Quiz',
                    onPressed: () {
                      Get.until(
                          (route) => Get.currentRoute == Dashboard.routeName);
                    })
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
