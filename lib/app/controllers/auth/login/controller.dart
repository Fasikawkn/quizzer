import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/pages/auth/auth.dart';
import 'package:quiz_app/app/pages/dashboard/dashboard.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginPageState = Rx<PageState>(PageState.initial);

  final authProvider = FirebaseAuth.instance;

  Future<void> signinWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        loginPageState(PageState.loading);
        final _res = await authProvider.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        loginPageState(PageState.success);
        Get.offNamedUntil(Dashboard.routeName, (route) => false);
      } on FirebaseAuthException catch (e) {
        debugPrint('THe error is ${e.message}');
      } catch (e) {
        loginPageState(PageState.error);
      }
    }
  }

  void signupOnPressed() {
    Get.offNamed(SignupPage.routeName);
  }
}
