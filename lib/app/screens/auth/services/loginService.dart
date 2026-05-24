import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/core/https/my_apis.dart';
import 'package:kitton/kitton.dart';

class LoginService {
  final KittonApi api;

  LoginService(this.api);

  Future<User> login({
    required String email,
    required String password,
  }) {
    return api.post<User>(
      AuthRoutes.login,
      data: {
        'email': email,
        'password': password,
      },
      model: User.new,
    );
  }
}
