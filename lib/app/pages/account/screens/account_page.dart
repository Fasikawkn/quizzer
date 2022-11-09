import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/profile/controller.dart';
import 'package:quiz_app/app/controllers/recent_results/binding.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/pages/account/screens/your_scores.dart';
import 'package:quiz_app/app/pages/account/widgets/user_detail_tile.dart';

import '../widgets/action_tile.dart';
import '../widgets/custom_container.dart';

class AccountPage extends GetView<ProfileController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Obx(() {
          final pageState = controller.profilePageState.value;
          if (pageState == PageState.initial ||
              pageState == PageState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (pageState == PageState.success) {
            final userData = controller.profileData.value;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3.r,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(userData!.image!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _buildLabel(context, 'User'),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomContainer(
                      child: Column(
                        children: [
                          UserDetailTile(
                            icon: Icons.person,
                            label: userData.fullname!,
                          ),
                          _buildDivider(),
                          UserDetailTile(
                            icon: Icons.contact_page,
                            label: userData.username!,
                          ),
                          _buildDivider(),
                          UserDetailTile(
                            icon: Icons.email,
                            label: userData.email!,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomContainer(
                      child: Column(
                        children: [
                          ActionTile(
                            icon: Icons.arrow_forward_ios,
                            label: 'Your Scores',
                            onTap: () {
                              Get.to(() => const YourScores(),
                                  transition: Transition.rightToLeft,
                                  binding: RecentResultBinding());
                            },
                          ),
                          _buildDivider(),
                          ActionTile(
                            icon: Icons.logout,
                            label: 'Logout',
                            onTap: controller.logout,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        }));
  }

  _buildDivider() {
    return Padding(
      padding: EdgeInsets.only(right: 30.w, left: 15.w),
      child: Divider(
        color: Colors.grey,
        thickness: 1.r,
      ),
    );
  }

  _buildLabel(BuildContext context, String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
