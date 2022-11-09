import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/models/score_data.dart';

class LeaderboardController extends GetxController {
  final firestoreProvider = FirebaseFirestore.instance;

  final pageState = Rx<PageState>(PageState.initial);

  final leaderBoard = Rx<List<ScoreData>>([]);

  @override
  onInit() {
    super.onInit();
    getLeaderboard();
  }

  Future<void> getLeaderboard() async {
    try {
      pageState(PageState.loading);
      final results = await firestoreProvider.collection('scores').get();
      debugPrint('The result ${results.docs.first.data()}');
      final _scoreData = results.docs;
      _scoreData.sort(((a, b) =>
          a.data()['results'].first['total'].compareTo(
          b.data()['results'].first['total'])));
      final _data = _scoreData.reversed
          .map((score) => ScoreData.fromJson(score.data()['results'].first))
          .toList();
      debugPrint('The leaderboard ${_data}');
      leaderBoard(_data);
      pageState(PageState.success);
    } catch (e,stack) {
      debugPrintStack(stackTrace: stack);
      debugPrint('The error is ${e.toString()}');
      pageState(PageState.error);
    }
  }
}
