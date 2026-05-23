import 'package:core_app/app/data/repository/auth_repository.dart';
import 'package:core_app/app/models/userModel.dart';
import 'package:core_app/core/getx/basecontroller.dart';

class ProfileController extends BaseControllerV2 {
  final ProfileRepository repository;

  ProfileController(this.repository);

  User? user;

  Future<void> getProfile() async {
    await runGuarded(() async {
      user = await repository.getProfile();

      setSuccess();
    });
  }
}