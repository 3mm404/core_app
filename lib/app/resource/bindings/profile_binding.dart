import 'package:core_app/app/controller/profileController.dart';
import 'package:core_app/app/data/repository/auth_repository.dart';
import 'package:core_app/app/data/services/profileService.dart';
import 'package:core_app/core/api/api.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileService>(
      () => ProfileService(Get.find<Api>()),
    );

    Get.lazyPut<ProfileRepository>(
      () => ProfileRepository(Get.find<ProfileService>()),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(Get.find<ProfileRepository>()),
    );
  }
}