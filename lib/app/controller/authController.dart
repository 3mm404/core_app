import 'package:core_app/app/data/repositories/auth_repository.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:core_app/core/getx/basecontroller.dart';

class AuthController extends BaseControllerV2 {
  final AuthRepository repository;
  final Session session;

  AuthController(this.repository, this.session);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await runGuarded(() async {
      final result = await repository.login(
        email: email,
        password: password,
      );

      session.set(result);

      setSuccess();
    });
  }

  Future<void> logout() async {
    await runGuarded(() async {
      session.clear();

      setSuccess();
    });
  }
}