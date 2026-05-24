import 'package:core_app/app/modules/profile/services/profile_service.dart';
import 'package:core_app/app/data/models/user.dart';

class ProfileRepository {
  final ProfileService service;

  ProfileRepository(this.service);

  Future<User> getProfile() {
    return service.getProfile();
  }
}