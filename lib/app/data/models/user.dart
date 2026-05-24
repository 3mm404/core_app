import 'package:core_app/app/data/models/wallet.dart';
import 'package:kitton/kitton.dart';

class User extends Kitton {
  User(super.data);

  /// Allowed fields for login requests.
  static const login = ['email', 'password'];

  /// Allowed fields for register requests.
  static const register = ['name', 'email', 'password', 'phone_number'];

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

  String get confirmPassword => string('confirm_password');

  String get token => string('token');

  Wallet? get wallet => model<Wallet>('wallet', Wallet.new);

  bool get isAdmin => role == 'admin';

  bool get isDriver => role == 'driver';

  bool get isActive => status == 'active';
}
