import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:quiz_app/app/pages/dashboard/dashboard.dart';
import 'package:quiz_app/app/routes/page_routes.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,

      builder: (BuildContext context, child) => GetMaterialApp(
        getPages: AppPages.appPages,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: generateMaterialColor(
            color: const Color(0xff06D2F6),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? Dashboard.routeName
            : AppPages.initialRoute,
      ),
    );
  }
}
