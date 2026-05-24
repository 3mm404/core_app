import 'package:core_app/app/modules/profile/services/profile_service.dart';
import 'package:core_app/app/data/models/user.dart';

class ProfileProviders {
  final ProfileService service;

  ProfileProviders(this.service);

  Future<User> getProfile() {
    return service.getProfile();
  }
}