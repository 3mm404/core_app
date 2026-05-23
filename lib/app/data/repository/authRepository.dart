import 'package:core_app/app/data/services/authServices.dart';
import 'package:core_app/app/models/authModel.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<Auth> login({
    required String email,
    required String password,
  }) {
    return service.login(
      email: email,
      password: password,
    );
  }

  Future<Auth> register({
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