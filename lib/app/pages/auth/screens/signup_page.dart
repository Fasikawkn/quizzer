import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/app/models/page_status.dart';

import '../../../constants/text_styles.dart';
import '../../../controllers/controller.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignupPage extends GetView<SignupController> {
  static const routeName = '/signup';
  const SignupPage({Key? key}) : super(key: key);

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
              SizedBox(
                height: 50.h,
              ),
              Text(
                'Signup',
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
                      InkWell(
                        onTap: () async {
                          final _source =
                              await Get.bottomSheet(_buildImagePicker(context));
                          if (_source != null) {
                            controller.pickImage(_source);
                          }
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: 50.r,
                            backgroundImage: controller.profileImage.value != ''
                                ? FileImage(
                                    File(controller.profileImage.value),
                                  )
                                : null,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            child: controller.profileImage.value == ''
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                    ),
                                    child: Text(
                                      'choose Image',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                          controller: controller.nameController,
                          hintText: 'Full name',
                          prefixIcon: Icons.person),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.usernameController,
                        hintText: 'Username',
                        prefixIcon: Icons.contact_page,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
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
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.confirmPasswordController,
                        hintText: 'Confirm password',
                        isObscured: true,
                        prefixIcon: Icons.lock_open,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() =>
                          controller.registerState.value == PageState.loading
                              ? LinearProgressIndicator(
                                  minHeight: 3.h,
                                )
                              : SizedBox(
                                  height: 3.h,
                                )),
                      SizedBox(
                        height: 47.h,
                      ),
                      CustomRoundedButton(
                        onPressed: controller.registerWithEmailAndPassword,
                        label: 'SIGNUP',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextButton(
                            onPressed: controller.loginOnPressed,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      _buildOr(context),
                      SizedBox(
                        height: 20.h,
                      ),
                      _buildGoogleButton(context),
                      SizedBox(
                        height: 30.h,
                      ),
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

  _buildImagePicker(BuildContext context) {
    return Container(
      height: 200.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Text(
              'Choose Image',
              style: TextStyle(
                fontSize: 30.sp,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: () {
                    Get.back(result: ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(fontSize: 18.sp),
                      )
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    Get.back(result: ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Gallary',
                        style: TextStyle(fontSize: 18.sp),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  _buildGoogleButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          fixedSize: Size(
            320.w,
            60.h,
          ),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5.r,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/google_logo.png',
            width: 20.w,
          ),
          Text(
            'Continue with google',
            style: buttonText.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  _buildOr(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Divider(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                thickness: 1.5.r,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                'OR',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: Divider(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                thickness: 1.5.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
