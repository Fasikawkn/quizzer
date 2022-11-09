import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/home/question/controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController());
  }
}
