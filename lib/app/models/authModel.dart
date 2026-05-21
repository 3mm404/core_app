import 'package:core_app/app/models/userModel.dart';
import 'package:core_app/core/kitton/kitton.dart';

class Auth extends Kitton {
  Auth(super.data);

  static const login = [
    'email',
    'password',
  ];

  static const register = [
    'name',
    'email',
    'password',
  ];

  User get user => model<User>(
        'user',
        User.new,
      );

  String get email => string('email');

  String get password => string('password');

  String get token => string('token');
}