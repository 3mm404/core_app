import 'package:core_app/app/middlewares/authMiddleware.dart';
import 'package:core_app/app/modules/profile/views/home_page.dart';
import 'package:core_app/app/modules/auth/views/login_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
}

class AppPages {
  static final pages = [
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