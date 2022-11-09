import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/home/question/binding.dart';
import 'package:quiz_app/app/pages/home/screens/question_page.dart';

class HomeController extends GetxController {
  void categoryOnTap(String category) {
    Get.to(
      () => const QuestionPage(),
      binding: QuestionBinding(),
      arguments: category,
    );
  }
}
