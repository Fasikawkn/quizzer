import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/constants/text_styles.dart';
import 'package:quiz_app/app/pages/auth/widgets/custom_rounded_button.dart';

import '../../../controllers/controller.dart';
import '../../../models/page_status.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends GetView<LoginController> {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
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
                height: 50.h,
              ),
              Text(
                'Login',
                style: headerOneText,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: controller.emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        hintText: 'Password',
                        isObscured: true,
                        prefixIcon: Icons.lock_open,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Obx(() =>
                          controller.loginPageState.value == PageState.loading
                              ? LinearProgressIndicator(
                                  minHeight: 3.h,
                                )
                              : SizedBox(
                                  height: 3.h,
                                )),
                      SizedBox(
                        height: 37.h,
                      ),
                      CustomRoundedButton(
                        onPressed: controller.signinWithEmailAndPassword,
                        label: 'LOGIN',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextButton(
                              onPressed: controller.signupOnPressed,
                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
