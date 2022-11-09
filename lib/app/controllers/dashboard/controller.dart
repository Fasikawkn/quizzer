import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/app/pages/home/screens/question_page.dart';
import '../../models/question.dart';
import '../../pages/pages.dart';

class DashboardController extends GetxController {
  final index = Rx<int>(0);
  

  Widget getBody() {
    if (index.value == 0) {
      return const Homepage();
    } else if (index.value == 1) {
      return const LeaderboardPage();
    } else {
      return const AccountPage();
    }
  }

  void onTabChanged(int page) {
    index(page);
  }

  
}
