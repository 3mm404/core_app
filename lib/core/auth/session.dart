
import 'package:core_app/app/models/authModel.dart';
import 'package:core_app/app/models/userModel.dart';
import 'package:core_app/core/https/storage/storage.dart';
import 'package:get/get.dart';

class Session {
  final StorageService storage;

  final Rxn<User> user = Rxn<User>();

  Session(this.storage);
   
  bool get isLoggedIn => user.value != null;

  String? get token => storage.getToken();

  void set(Auth auth) {
    storage.saveToken(auth.token);

    user.value = auth.user;
  }

  void clear() {
    storage.removeToken();

    user.value = null;
  }
}