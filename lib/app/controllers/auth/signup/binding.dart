import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/auth/signup/controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
