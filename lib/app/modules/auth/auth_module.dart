import 'package:core_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:core_app/app/modules/auth/repositories/auth_repository.dart';
import 'package:core_app/app/modules/auth/services/auth_service.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:kitton/kitton.dart';

class AuthModule extends KittonModule {
  @override
  void register() {
    bind(() => AuthService(find<KittonApi>()));

    bind(() => AuthRepository(find<AuthService>()));

    bind(
      () => AuthController(
        find<AuthRepository>(),
        find<Session>(),
      ),
    );
  }
}