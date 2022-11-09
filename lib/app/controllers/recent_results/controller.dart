import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/models/score_data.dart';

class RecentResultController extends GetxController {
  final firestoreProvider = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  final pageState = Rx<PageState>(PageState.initial);
  final recentResult = Rx<List<ScoreData>>([]);

  @override
  void onInit() {
    super.onInit();
    getRecentResult();
  }

  Future<void> getRecentResult() async {
    try {
      pageState(PageState.loading);
      final _user = firebaseAuth.currentUser;
      final _res =
          await firestoreProvider.collection('scores').doc(_user!.uid).get();
      final results = _res['results'] as List;
      debugPrint('The results are $results');
      final _value = results.map((score) => ScoreData.fromJson(score)).toList();
      recentResult(_value);
      pageState(PageState.success);
    } catch (e) {
      pageState(PageState.error);
      debugPrint(e.toString());
    }
  }
}
