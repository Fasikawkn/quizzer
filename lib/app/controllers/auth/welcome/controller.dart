import 'package:get/get.dart';

import '../../../pages/pages.dart';

class WelcomeController extends GetxController {
  void signupOnPressed() {
    Get.offNamed(SignupPage.routeName);
  }

  void loginOnPressed() {
    Get.offNamed(LoginPage.routeName);
  }
}
