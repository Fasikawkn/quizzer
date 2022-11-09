import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/auth/auth.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
