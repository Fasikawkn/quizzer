import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(),
    );
  }
}
