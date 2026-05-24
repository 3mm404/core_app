import 'package:core_app/app/screens/auth/controllers/auth_controller.dart';
import 'package:core_app/app/screens/auth/providers/authProviders.dart';
import 'package:core_app/app/screens/auth/services/auth_service.dart';
import 'package:core_app/core/session/session.dart';
import 'package:kitton/kitton.dart';


class AuthRBindings extends KittonRegister {
   @override
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