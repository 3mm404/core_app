import 'package:core_app/app/modules/auth/models/user.dart';
import 'package:core_app/app/modules/auth/services/auth_service.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<User> login({
    required String email,
    required String password,
  }) {
    return service.login(
      email: email,
      password: password,
    );
  }

  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) {
    return service.register(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<void> logout() {
    return service.logout();
  }
}