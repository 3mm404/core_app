import 'package:core_app/app/controller/authController.dart';
import 'package:core_app/app/services/authServices.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:core_app/core/api/api.dart';
import 'package:core_app/core/https/http_service.dart';
import 'package:core_app/core/https/storage/storage.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Registrar StorageService (no tiene dependencias)
    Get.lazyPut<StorageService>(() => StorageService());

    // 2. Registrar HttpService (necesita StorageService)
    Get.lazyPut<HttpService>(
      () => HttpService(Get.find<StorageService>()),
    );

    // 3. Registrar Api (necesita HttpService)
    Get.lazyPut<Api>(
      () => Api(Get.find<HttpService>()),
    );

    // 4. Registrar Session (necesita StorageService)
    Get.lazyPut<Session>(
      () => Session(Get.find<StorageService>()),
    );

    // 5. Registrar AuthService (necesita Api)
    Get.lazyPut<AuthService>(
      () => AuthService(Get.find<Api>()),
    );

    // 6. Registrar AuthController (necesita AuthService y Session)
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.find<AuthService>(),
        Get.find<Session>(),
      ),
    );
  }
}