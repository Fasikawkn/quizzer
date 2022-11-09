import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/profile/controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
