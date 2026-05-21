import 'package:core_app/app/models/userModel.dart';
import 'package:core_app/core/api/api.dart';
import 'package:core_app/core/https/my_apis.dart';

class ProfileService {
  final Api api;

  ProfileService(this.api);

  Future<User> getProfile() {
    return api.get<User>(
      ApiProfileRoutes.userProfile,
      model: User.new,
    );
  }
}
