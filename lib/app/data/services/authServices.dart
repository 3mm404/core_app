import 'package:core_app/app/data/models/userModel.dart';
import 'package:core_app/core/api/api.dart';
import 'package:core_app/core/https/my_apis.dart';

class AuthService {
  final Api api;

  AuthService(this.api);

  Future<User> login({
    required String email,
    required String password,
  }) {
    return api.post<User>(
      ApiAuthRoutes.login,
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
      ApiAuthRoutes.register,
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
      ApiAuthRoutes.logout,
    );
  }
}