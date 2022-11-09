import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/home/question/controller.dart';
import 'package:quiz_app/app/models/page_status.dart';

import '../widgets/question_choice_button.dart';
import '../widgets/question_indicator.dart';
import '../widgets/quit_quiz_button.dart';

class QuestionPage extends GetView<QuestionController> {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff141A33),
        body: Obx((() {
          final _pageState = controller.pageState.value;
          if (_pageState == PageState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_pageState == PageState.success) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            '${controller.quizCategory} Quiz',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Question ${controller.currentIndex.value < 10 ? '0${controller.currentIndex.value + 1}' : controller.currentIndex.value + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '/${controller.questions.value.length}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                              children: controller.questions.value
                                  .map((
                                    data,
                                  ) =>
                                      QuestionIndicator(
                                        color: controller.getColor(data),
                                      ))
                                  .toList()),
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            controller.questions
                                .value[controller.currentIndex.value].question!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .questions
                                    .value[controller.currentIndex.value]
                                    .choices!
                                    .length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  final choices = controller
                                      .questions
                                      .value[controller.currentIndex.value]
                                      .choices![index];
                                  return QuestionChoiceButton(
                                    label: choices,
                                    status: controller.getQuestion(index),
                                    onPressed: () {
                                      controller.onAnswer(index);
                                    },
                                  );
                                })),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuitQuizButton(
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        CustomElevatedButton(
                          label: 'Next',
                          color: controller.getButtonColor(),
                          onPressed: controller.onNext,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        })));
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.color,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            10.r,
          )),
          minimumSize: Size(
            150.w,
            60.h,
          )),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}

enum QuestionStatus {
  unAnswered,
  answered,
  missed,
}
