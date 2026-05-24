import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/app/screens/auth/services/registerService.dart';

class RegisterProvider {
  final RegisterService registerService;

  RegisterProvider(this.registerService);

  Future<User> register(User request) {
    return registerService.register(request);
  }
}