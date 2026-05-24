import 'package:core_app/app/screens/auth/controllers/loginController.dart';
import 'package:core_app/app/screens/auth/controllers/RegisterController.dart';
import 'package:core_app/app/screens/auth/controllers/logoutController.dart';

import 'package:core_app/app/screens/auth/providers/loginProvider.dart';
import 'package:core_app/app/screens/auth/providers/registerProvider.dart';
import 'package:core_app/app/screens/auth/providers/logoutProvider.dart';

import 'package:core_app/app/screens/auth/services/loginService.dart';
import 'package:core_app/app/screens/auth/services/registerService.dart';
import 'package:core_app/app/screens/auth/services/logoutService.dart';

import 'package:core_app/core/session/session.dart';
import 'package:kitton/kitton.dart';

class AuthBinding extends KittonRegister {
  @override
  void register() {
    // Services
    bind(() => LoginService(find<KittonApi>()));
    bind(() => RegisterService(find<KittonApi>()));
    bind(() => LogoutService(find<KittonApi>()));

    // Providers
    bind(() => LoginProviders(find<LoginService>()));
    bind(() => RegisterProvider(find<RegisterService>()));
bind(
  () => LogoutProvider(
    logoutservice: find<LogoutService>(),
  ),
);
    // Controllers
    bind(
      () => Logincontroller(
        find<LoginProviders>(),
        find<Session>(),
      ),
    );

    bind(
      () => RegisterController(
        find<RegisterProvider>(),
      ),
    );

    bind(
      () => LogoutController(
        find<LogoutProvider>(),
        find<Session>(),
      ),
    );
  }
}