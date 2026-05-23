import 'package:core_app/app/data/models/userModel.dart';
import 'package:core_app/core/getx/storage.dart';
import 'package:get/get.dart';

class Session {
  final StorageService storage;

  final Rxn<User> user = Rxn<User>();

  Session(this.storage);
   
  bool get isLoggedIn => user.value != null;

  String? get token => storage.getToken();

  void set(User auth) {
    storage.saveToken(auth.token);

    user.value = auth;
  }

  void clear() {
    storage.removeToken();

    user.value = null;
  }
}