import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/leaderboard/controller.dart';

class LeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderboardController>(() => LeaderboardController());
  }
}
