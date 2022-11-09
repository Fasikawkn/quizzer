import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/controller.dart';

import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
