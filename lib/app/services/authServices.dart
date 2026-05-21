import 'package:core_app/app/models/authModel.dart';
import 'package:core_app/core/api/api.dart';
import 'package:core_app/core/https/my_apis.dart';

class AuthService {
  final Api api;

  AuthService(this.api);

  Future<Auth> login({
    required String email,
    required String password,
  }) {
    return api.post<Auth>(
      ApiAuthRoutes.login,
      data: {
        'email': email,
        'password': password,
      },
      model: Auth.new,
    );
  }

  Future<Auth> register({
    required String name,
    required String email,
    required String password,
  }) {
    return api.post<Auth>(
      ApiAuthRoutes.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
      model: Auth.new,
    );
  }

Future<void> logout() async {
  await api.postVoid(
    ApiAuthRoutes.logout,
  );
}
}