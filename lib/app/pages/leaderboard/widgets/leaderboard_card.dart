import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/app/models/score_data.dart';

class LeaderBoardCard extends StatelessWidget {
  const LeaderBoardCard({
    Key? key,
   required this.scoreData,
  }) : super(key: key);
  final ScoreData scoreData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 10.r,
      ),
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffEDF3F6),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  scoreData.picture!,
                ),
              ),
              SizedBox(
                width: 20.0.h,
              ),
              Text(
                scoreData.username!,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          Text(
            scoreData.total.toString(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18.sp,
            ),
          )
        ],
      ),
    );
  }
}
