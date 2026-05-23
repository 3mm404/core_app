import 'package:core_app/app/data/services/profileService.dart';
import 'package:core_app/app/data/models/userModel.dart';

class ProfileRepository {
  final ProfileService service;

  ProfileRepository(this.service);

  Future<User> getProfile() {
    return service.getProfile();
  }
}