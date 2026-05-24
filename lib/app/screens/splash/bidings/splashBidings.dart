import 'package:core_app/app/screens/splash/controller/splash_controller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:kitton/kitton.dart';

class SplashRegister extends KittonRegister {
  @override
  void register() {
    bind(() => SplashController(find<Session>()));
  }
}