import 'package:get/get.dart';
import 'package:quiz_app/app/pages/home/screens/question_page.dart';

class Question {
  int? id;
  String? question;
  int? answer;
  List<String>? choices;
  Rx<QuestionStatus> status = QuestionStatus.unAnswered.obs;

  Question({
    this.id,
    this.question,
    this.answer,
    this.choices,
    required this.status,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    choices = json['choices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['questions'] = choices;
    return data;
  }
}
