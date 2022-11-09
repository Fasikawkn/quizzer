import 'package:get/get.dart';
import 'package:quiz_app/app/controllers/leaderboard/binding.dart';
import 'package:quiz_app/app/controllers/profile/binding.dart';

import '../controllers/controller.dart';
import '../controllers/home/home_page/binding.dart';
import '../pages/pages.dart';

class AppPages {
  AppPages._();
  static const initialRoute = WelcomePage.routeName;

  static final appPages = [
    GetPage(
      name: WelcomePage.routeName,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: LoginPage.routeName,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: SignupPage.routeName,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Dashboard.routeName,
      page: () => const Dashboard(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        ProfileBinding(),
        LeaderboardBinding()
      ],
    ),
  ];
}
