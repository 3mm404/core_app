import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/app/screens/auth/services/auth_service.dart';

class AuthProviders {
  final AuthService service;

  AuthProviders(this.service);

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