import 'package:core_app/app/resource/home_page.dart';
import 'package:core_app/app/resource/test_view.dart';
import 'package:core_app/app/resource/bindings/auth_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: AuthBinding(),
    ),
  ];
}
