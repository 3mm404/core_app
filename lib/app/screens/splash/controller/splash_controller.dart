import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final Session session;

  SplashController(this.session);

  @override
  void onReady() {
    super.onReady();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));

    if (session.isLoggedIn) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}