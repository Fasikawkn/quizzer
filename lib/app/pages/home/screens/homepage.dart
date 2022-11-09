import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/constants/dummy_text.dart';

import '../../../controllers/home/home_page/controller.dart';
import '../widgets/quiz_category_card.dart';

class Homepage extends GetView<HomeController> {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz.webp',
                width: 333.w,
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Text(
                    'Quiz Categories',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h),
                  itemBuilder: (context, index) => QuizCategoryCard(
                    onTap: () {
                      controller.categoryOnTap(quizCategories[index]['name']!);
                    },
                    image: quizCategories[index]['image']!,
                    title: quizCategories[index]['name']!,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
