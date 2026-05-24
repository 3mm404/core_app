import 'package:core_app/app/modules/auth/models/user.dart';
import 'package:core_app/core/getx/storage.dart';
import 'package:get/get.dart';
import 'package:kitton/kitton.dart';

class Session {
  final StorageService storage;

  final Rxn<User> user = Rxn<User>();

  Session(this.storage);

  String? get token => storage.getToken();

  bool get isLoggedIn => token != null && token!.isNotEmpty;

  Future<void> set(User user) async {
    final token = user.token;

    print('USER JSON: ${user.toJson()}');
    print('TOKEN FROM USER: $token');

    if (token.isEmpty) {
      print('TOKEN EMPTY - CLEARING SESSION');
      await clear();
      return;
    }

    await storage.saveToken(token);
    this.user.value = user;

    print('TOKEN SAVED: ${storage.getToken()}');
  }

  void setUser(User user) {
    this.user.value = user;
  }

  Future<void> clear() async {
    await storage.removeToken();
    user.value = null;
  }
}