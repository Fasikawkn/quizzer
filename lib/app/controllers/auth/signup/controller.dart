import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/models/register_user_data.dart';
import 'package:quiz_app/app/pages/auth/auth.dart';
import 'package:quiz_app/app/pages/dashboard/screens/dashboard_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final profileImage = Rx<String>('');
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final registerState = PageState.initial.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signupOnPressed() {
    Get.offNamed(Dashboard.routeName);
  }

  void loginOnPressed() {
    Get.offNamed(LoginPage.routeName);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final _imageData = await ImagePicker().pickImage(source: source);
      if (_imageData != null) {
        profileImage(_imageData.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> registerWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        final userData = RegisterUserData(
          fullname: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          image: profileImage.value,
          username: usernameController.text,
        );
        registerState(PageState.loading);
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userData.email!,
          password: userData.password!,
        );
        User? user = userCredential.user;
        await saveUserToCloud(userData, user!.uid);
      } on FirebaseAuthException catch (e) {
        registerState(PageState.error);
        debugPrint('The register error is ${e.code}');
      } catch (e) {
        registerState(PageState.error);
        debugPrint('The users are');
      }
    }
  }

  Future<void> saveUserToCloud(RegisterUserData userData, String uid) async {
    try {
      final String fileName = basename(userData.image!);
      File _imageFile = File(userData.image!);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('profle/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);

      uploadTask.snapshotEvents.listen((event) async {
        if (event.state == TaskState.success) {
          final _image = await event.ref.getDownloadURL();
          debugPrint('The image path2 is $_image');
          userData.image = _image;
          await _firestore.collection('users').doc(uid).set(userData.toJson());
          registerState(PageState.success);
          Get.offNamedUntil(Dashboard.routeName, (route) => false);
        }
      });
    } on FirebaseAuthException catch (e) {
      debugPrint('The register error is ${e.code}');
    } catch (e) {
      debugPrint('The users are');
    }
  }

  Future<String> saveImage(String image) async {
    String _image = '';

    return _image;
  }
}
