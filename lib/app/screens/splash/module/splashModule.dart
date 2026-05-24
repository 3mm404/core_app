import 'package:core_app/app/screens/splash/controller/splash_controller.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:kitton/kitton.dart';

class SplashModule extends KittonModule {
  @override
  void register() {
    bind(() => SplashController(find<Session>()));
  }
}