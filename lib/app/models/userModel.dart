import 'package:core_app/core/kitton/kitton.dart';

class User extends Kitton {
  User(super.data);

  /// Allowed fields for login requests.
  static const login = [
    'email',
    'password',
  ];

  /// Allowed fields for register requests.
  static const register = [
    'name',
    'email',
    'password',
    'phone_number',
  ];

  String get id => string('id');

  String get name => string('name');

  String get email => string('email');

  String get phoneNumber => string('phone_number');

  String get password => string('password');

  String get roles => string('roles');

  /// Indicates if the current user is an admin.
  bool get isAdmin => roles == 'admin';

  /// Indicates if the current user is a driver.
  bool get isDriver => roles == 'driver';
}