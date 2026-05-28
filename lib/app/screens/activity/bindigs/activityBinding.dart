import 'package:core_app/app/screens/activity/controllers/criptControllers.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kitton/kitton.dart';

class CryptoSocketService extends KittonRegister {
  @override
  void register() {
      
      bind(() => CryptoController(Get.find()));
  }
}