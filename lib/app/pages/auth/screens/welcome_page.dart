import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/constants/text_styles.dart';
import 'package:quiz_app/app/controllers/auth/auth.dart';

import '../widgets/custom_rounded_button.dart';

class WelcomePage extends GetView<WelcomeController> {
  static const routeName = '/welcomepage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Welcome to Quizer',
                style: headerOneText,
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Image(
                  width: 200.w,
                  image: const AssetImage(
                    'assets/images/quiz_logo.png',
                  ),
                ),
              ),
              SizedBox(
                height: 150.h,
              ),
              CustomRoundedButton(
                label: 'Login',
                onPressed: controller.loginOnPressed,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomRoundedButton(
                label: 'Signup',
                onPressed: controller.signupOnPressed,
                labelColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(
                      0.2,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
