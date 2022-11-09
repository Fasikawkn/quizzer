import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/question_page.dart';

class QuestionChoiceButton extends StatelessWidget {
  const QuestionChoiceButton({
    Key? key,
    required this.status,
    required this.onPressed,
    required this.label,
  }) : super(key: key);
  final QuestionStatus status;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 50.h),
            side: BorderSide(
              color: status == QuestionStatus.unAnswered
                  ? Colors.white
                  : status == QuestionStatus.answered
                      ? Theme.of(context).primaryColor
                      : Colors.red,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: status == QuestionStatus.unAnswered
                    ? Colors.white
                    : status == QuestionStatus.answered
                        ? Theme.of(context).primaryColor
                        : Colors.red,
              ),
            ),
            status == QuestionStatus.answered
                ? CircleAvatar(
                    radius: 13.r,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18.r,
                    ),
                  )
                : Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: status == QuestionStatus.unAnswered
                            ? Colors.white
                            : Colors.red,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

