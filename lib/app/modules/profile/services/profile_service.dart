import 'package:core_app/app/modules/auth/models/user.dart';
import 'package:core_app/core/https/my_apis.dart';
import 'package:kitton/kitton.dart';

class ProfileService {
  final KittonApi api;

  ProfileService(this.api);

  Future<User> getProfile() {
    return api.get<User>(
      UserProfile.profile,
      model: User.new,
    );
  }
}