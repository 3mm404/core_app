import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/app/screens/auth/providers/logoutProvider.dart';
import 'package:core_app/core/services/basecontroller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LogoutController extends BaseControllerV2 {
  final LogoutProvider provider;

  LogoutController(this.provider, Session find);

  Future<void> logout() async {
    await runGuarded(() async {
      await provider.logout();
     Get.offAllNamed(AppRoutes.home);
    });
  }
}