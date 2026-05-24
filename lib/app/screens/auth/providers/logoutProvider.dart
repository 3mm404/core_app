import 'package:core_app/app/screens/auth/services/logoutService.dart';

class LogoutProvider {
  final LogoutService logoutservice;

  LogoutProvider({required this.logoutservice});

  Future<void> logout() {
    return logoutservice.logout();
  }
}