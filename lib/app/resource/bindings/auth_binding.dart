import 'package:core_app/app/controller/authController.dart';
import 'package:core_app/app/data/repositories/authRepository.dart';
import 'package:core_app/app/data/services/authServices.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:core_app/core/api/api.dart';
import 'package:core_app/core/https/http_service.dart';
import 'package:core_app/core/getx/storage.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Registrar StorageService
    Get.lazyPut<StorageService>(
      () => StorageService(),
    );

    // 2. Registrar HttpService
    Get.lazyPut<HttpService>(
      () => HttpService(Get.find<StorageService>()),
    );

    // 3. Registrar Api
    Get.lazyPut<Api>(
      () => Api(Get.find<HttpService>()),
    );

    // 4. Registrar Session
    Get.lazyPut<Session>(
      () => Session(Get.find<StorageService>()),
    );

    // 5. Registrar AuthService
    Get.lazyPut<AuthService>(
      () => AuthService(Get.find<Api>()),
    );

    // 6. Registrar AuthRepository
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(Get.find<AuthService>()),
    );

    // 7. Registrar AuthController
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.find<AuthRepository>(),
        Get.find<Session>(),
      ),
    );
  }
}