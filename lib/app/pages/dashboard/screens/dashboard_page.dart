import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends GetView<DashboardController> {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.getBody(),
        bottomNavigationBar: GNav(
          onTabChange: controller.onTabChanged,
          tabBackgroundColor: Theme.of(context).primaryColor,
          tabBorderRadius: 30.r,
          duration: const Duration(milliseconds: 100), // tab animation duration
          activeColor: Colors.white,
          color: Colors.grey,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.leaderboard,
              text: 'Leaderboard',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
