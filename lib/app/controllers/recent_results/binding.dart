import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/recent_results/controller.dart';

class RecentResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecentResultController>(() => RecentResultController() );
  }
}
