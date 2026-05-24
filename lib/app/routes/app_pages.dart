import 'package:core_app/app/middlewares/authMiddleware.dart';
import 'package:core_app/app/screens/profile/views/home_page.dart';
import 'package:core_app/app/screens/auth/views/login_page.dart';
import 'package:core_app/app/screens/splash/views/splashPage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      middlewares: [
        GuestMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}