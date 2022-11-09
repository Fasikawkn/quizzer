import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/auth/welcome/controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
