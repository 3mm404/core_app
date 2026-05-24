import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/core/https/my_apis.dart';
import 'package:kitton/kitton.dart';

class RegisterService {
  final KittonApi api;

  RegisterService(this.api);

  Future<User> register(User request) {
    return api.post<User>(
      AuthRoutes.register,
      data: request.only(User.register),
      model: User.new,
    );
  }
}