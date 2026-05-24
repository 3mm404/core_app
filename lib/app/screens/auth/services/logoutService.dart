import 'package:core_app/core/https/my_apis.dart';
import 'package:kitton/kitton.dart';

class LogoutService {
  final KittonApi api;

  LogoutService(this.api);
  Future<void> logout() async {
    await api.postVoid(
       AuthRoutes.logout,
    );
  }
}
