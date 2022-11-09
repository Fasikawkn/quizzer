import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/constants/dummy_text.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/models/register_user_data.dart';
import 'package:quiz_app/app/models/score_data.dart';
import 'package:quiz_app/app/pages/home/screens/question_page.dart';

import '../../../models/question.dart';
import '../../../pages/home/screens/result_page.dart';

class QuestionController extends GetxController {
  final firestoreProvider = FirebaseFirestore.instance;
  final authService = FirebaseAuth.instance;

  final questions = Rx<List<Question>>([]);

  final pageState = Rx<PageState>(PageState.initial);
  final saveState = Rx<PageState>(PageState.initial);

  final quizCategory = Rxn<String>();
  final currentIndex = Rx<int>(0);
  final answer = Rxn<int>();
  final showAnswer = Rx<bool>(false);

  @override
  onInit() {
    super.onInit();
    getQuestions();
  }

  Future<void> getQuestions() async {
    try {
      pageState(PageState.loading);
      final category = Get.arguments;
      quizCategory(category);
      final _res =
          await firestoreProvider.collection('questions').doc(category).get();
      debugPrint('The response is ${jsonEncode(_res.data())}');
      final _question = (_res.data()!['questions'] as List)
          .map((question) => Question.fromJson(question))
          .toList();
      questions(_question);
      pageState(PageState.success);
    } catch (e, stacktrace) {
      debugPrintStack(stackTrace: stacktrace);
      pageState(PageState.error);
      debugPrint('Error ${e.toString()}');
    }
  }

  QuestionStatus getQuestion(int index) {
    if (showAnswer.value) {
      if (questions.value[currentIndex.value].answer == index) {
        return QuestionStatus.answered;
      }
      if (answer.value == index &&
          questions.value[currentIndex.value].answer == index) {
        return QuestionStatus.answered;
      } else if (answer.value == index &&
          questions.value[currentIndex.value].answer != index) {
        return QuestionStatus.missed;
      } else {
        return QuestionStatus.unAnswered;
      }
    }
    return QuestionStatus.unAnswered;
  }

  void onNext() async {
    showAnswer(false);
    answer(null);
    final currentQuestion = questions.value[currentIndex.value];
    if (currentQuestion.status.value != QuestionStatus.unAnswered) {
      if (currentIndex.value < questions.value.length - 1) {
        currentIndex(currentIndex.value + 1);
      } else {
        Get.dialog(const SpinKitFadingCircle(
          color: Colors.white,
        ));
        final result = questions.value
            .where((element) => element.status.value == QuestionStatus.answered)
            .length;
        final total = questions.value.length;
        List<String> _result = [
          result < 10 ? '0$result' : '$result',
          total < 10 ? '0$total' : '$total'
        ];
        await saveResult();
        Get.back();
        saveState(PageState.success);
        Get.off(
          () => ResultPage(
            result: _result,
          ),
          transition: Transition.rightToLeft,
        );
      }
    }
  }

  Future<List<ScoreData>> getScoreData() async {
    try {
      final _user = authService.currentUser;
      final _res =
          await firestoreProvider.collection('scores').doc(_user!.uid).get();
      final results = _res['results'] as List;
      debugPrint('The results are $results');
      return results.map((score) => ScoreData.fromJson(score)).toList();
    } on FirebaseException catch (e) {
      debugPrint('The Error is ${e.code}');
      return [];
    } catch (e) {
      if (e.toString() ==
          'Bad state: cannot get a field on a DocumentSnapshotPlatform which does not exist') {
        return [];
      }
      throw Exception(e.toString());
    }
  }

  Future<void> saveResult() async {
    try {
      final _user = authService.currentUser;
      final result = questions.value
          .where((element) => element.status.value == QuestionStatus.answered)
          .length;
      final total = questions.value.length;
      final _result = [
        result < 10 ? '0$result' : '$result',
        total < 10 ? '0$total' : '$total'
      ].join('/');

      final _scores = await getScoreData();
      late int _totalScore;
      if (_scores.isNotEmpty) {
        late int _latestScore;
        final catScore = _scores.firstWhere(
            (element) => element.category == quizCategory.value,
            orElse: () => ScoreData());
        if (catScore.category != null) {
          int score = int.parse(catScore.score!.split('/').first);
          final latestScore = _scores.first.total! - score;
          _latestScore = latestScore;
        } else {
          _latestScore = _scores.first.total!;
        }
        _totalScore = _latestScore + result;
      } else {
        _totalScore = result;
      }
      final _userData = await getUserData();
      debugPrint("The result of the score is $_scores");
      final _scoreData = ScoreData(
        category: quizCategory.value,
        date: DateTime.now().toIso8601String(),
        score: _result,
        total: _totalScore,
        picture: _userData.image,
        username: _userData.username,
      );
      _scores.insert(0, _scoreData);
      final _scoresData = _scores.map((e) => e.toJson());

      await firestoreProvider
          .collection('scores')
          .doc(_user!.uid)
          .set({'results': _scoresData.toList()});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<RegisterUserData> getUserData() async {
    final _user = authService.currentUser;
    try {
      final _res =
          await firestoreProvider.collection('users').doc(_user!.uid).get();
      return RegisterUserData.fromJson(_res.data()!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void onAnswer(int index) {
    debugPrint('The same $index');
    if (questions.value[currentIndex.value].status.value ==
        QuestionStatus.unAnswered) {
      answer(index);
      showAnswer(true);
      if (questions.value[currentIndex.value].answer == index) {
        questions.value[currentIndex.value].status(QuestionStatus.answered);
      } else {
        questions.value[currentIndex.value].status(QuestionStatus.missed);
      }
    }
  }

  Color getButtonColor() {
    if (questions.value[currentIndex.value].status.value !=
        QuestionStatus.unAnswered) {
      return const Color(0xff06D2F6);
    } else {
      return Colors.grey;
    }
  }

  Color getColor(Question value) {
    if (value.id! == currentIndex.value + 1) {
      return Colors.white;
    } else {
      if (value.status.value == QuestionStatus.answered) {
        return const Color(0xff06D2F6);
      } else if (value.status.value == QuestionStatus.unAnswered) {
        return Colors.white70;
      } else {
        return Colors.red;
      }
    }
  }
}
