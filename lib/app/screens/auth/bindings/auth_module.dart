import 'package:core_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:core_app/app/modules/auth/providers/auth_repository.dart';
import 'package:core_app/app/modules/auth/services/auth_service.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:kitton/kitton.dart';

class AuthModule extends KittonModule {
  @override
  void register() {
    bind(() => AuthService(find<KittonApi>()));

    bind(() => AuthProviders(find<AuthService>()));

    bind(
      () => AuthController(
        find<AuthProviders>(),
        find<Session>(),
      ),
    );
  }
}