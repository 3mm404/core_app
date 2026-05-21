import 'package:core_app/app/models/userModel.dart';
import 'package:core_app/app/services/profileService.dart';
import 'package:core_app/core/getx/basecontroller.dart';
import 'package:get/get.dart';

class ProfileController extends BaseControllerV2 {
  final ProfileService profileService;

  ProfileController(this.profileService);

  final Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    await runGuarded(() async {
      user.value = await profileService.getProfile();
      setSuccess();
    });
  }
}
