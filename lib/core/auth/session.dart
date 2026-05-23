import 'package:core_app/app/data/models/userModel.dart';
import 'package:core_app/core/getx/storage.dart';
import 'package:get/get.dart';

class Session {
  final StorageService storage;

  final Rxn<User> user = Rxn<User>();

  Session(this.storage);

  bool get isLoggedIn => token != null && token!.isNotEmpty;

  String? get token => storage.getToken();

  void set(User user) {
    final token = user.token;

    if (token.isEmpty) {
      clear();
      return;
    }

    storage.saveToken(token);
    this.user.value = user;
  }

  void setUser(User user) {
    this.user.value = user;
  }

  void clear() {
    storage.removeToken();
    user.value = null;
  }
}