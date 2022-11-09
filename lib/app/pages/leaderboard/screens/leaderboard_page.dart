import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/leaderboard/controller.dart';
import 'package:quiz_app/app/models/page_status.dart';

import '../widgets/leaderboard_card.dart';

class LeaderboardPage extends GetView<LeaderboardController> {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Leaderboard',
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(
            20.r,
          ),
          child: Obx(() {
            final pageState = controller.pageState.value;
            if (pageState == PageState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (pageState == PageState.success) {
              return RefreshIndicator(
                onRefresh: () => controller.getLeaderboard(),
                child: ListView.builder(
                  itemCount: controller.leaderBoard.value.length,
                  itemBuilder: ((context, index) {
                    return LeaderBoardCard(
                      scoreData: controller.leaderBoard.value[index],
                    );
                  }),
                ),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          })),
    );
  }
}
