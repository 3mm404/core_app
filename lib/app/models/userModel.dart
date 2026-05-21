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

  int get id => intValue('id');

  String get name => string('name');

  String get email => string('email');

  String get phoneNumber => string('phone_number');

  String get dateOfBirth => string('date_of_birth');

  bool get isAdult => boolValue('is_adult');

  String get role => string('role');

  String get avatar => string('avatar');

  bool get emailVerified => boolValue('email_verified');

  String get status => string('status');

  String get password => string('password');

  Wallet? get wallet => model<Wallet>(
        'wallet',
        Wallet.new,
      );

  bool get isAdmin => role == 'admin';

  bool get isDriver => role == 'driver';

  bool get isActive => status == 'active';
}

class Wallet extends Kitton {
  Wallet(super.data);

  num get balance => data['balance'] ?? 0;

  num get reserved => data['reserved'] ?? 0;
}