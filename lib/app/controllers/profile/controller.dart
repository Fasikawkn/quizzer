import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/models/register_user_data.dart';
import 'package:quiz_app/app/pages/auth/auth.dart';

class ProfileController extends GetxController {
  final authProvider = FirebaseAuth.instance;
  final firestoreProvider = FirebaseFirestore.instance;

  final profilePageState = Rx<PageState>(PageState.initial);
  final profileData = Rxn<RegisterUserData>();

  @override
  onInit() {
    super.onInit();
    getProfileData();
  }

  Future<void> getProfileData() async {
    try {
      profilePageState(PageState.loading);
      final _response = authProvider.currentUser;
      final _res =
          await firestoreProvider.collection('users').doc(_response!.uid).get();
      profileData(RegisterUserData.fromJson(_res.data()!));
      profilePageState(PageState.success);
    } catch (e) {
      profilePageState(PageState.error);
    }
  }

  Future<void> logout() async {
    try {
      await authProvider.signOut();
      Get.offNamedUntil(LoginPage.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      debugPrint('THe eror is ${e.toString()}');
    } catch (e) {
      debugPrint('THe eror is ${e.toString()}');
    }
  }
}
