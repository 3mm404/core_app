import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/core/https/my_apis.dart';
import 'package:kitton/kitton.dart';

class AuthService {
  final KittonApi api;

  AuthService(this.api);

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

  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) {
    return api.post<User>(
 AuthRoutes.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
      model: User.new,
    );
  }

  Future<void> logout() async {
    await api.postVoid(
       AuthRoutes.logout,
    );
  }
}