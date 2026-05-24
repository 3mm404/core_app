
import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/app/screens/auth/services/loginService.dart';

class LoginProviders {
  final LoginService loginservice;


  LoginProviders(this.loginservice);

  Future<User> login({
    required String email,
    required String password,
  }) {
    return loginservice.login(
      email: email,
      password: password,
    );
  }


}