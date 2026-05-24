import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/app/modules/profile/providers/profile_repository.dart';
import 'package:core_app/core/getx/basecontroller.dart';
import 'package:get/get.dart';

class ProfileController extends BaseControllerV2 {
  final ProfileProviders repository;

  ProfileController(this.repository);

  final Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    await runGuarded(() async {
      user.value = await repository.getProfile();

      setSuccess();
    });
  }
}