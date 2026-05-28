import 'package:core_app/app/screens/root/nav/controller/navigationControllers.dart';
import 'package:kitton/kitton.dart';

class NavigationRegister extends KittonRegister {
  @override
  void register() {
    bind(() => NavigationController());
  }
}