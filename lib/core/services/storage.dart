import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box = GetStorage();

  static const String tokenKey = 'auth_token';
  static const String roleKey = 'user_role';

  Future<void> saveToken(String token) async {
    await _box.write(tokenKey, token);
  }

  String? getToken() {
    return _box.read<String>(tokenKey);
  }

  Future<void> removeToken() async {
    await _box.remove(tokenKey);
  }

  bool get isLoggedIn {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }

  bool get isDriver => _box.read<String>(roleKey) == 'driver';

  Future<void> saveRole(String role) async {
    await _box.write(roleKey, role);
  }

  String? getRole() {
    return _box.read<String>(roleKey);
  }

  Future<void> save(String key, dynamic value) async {
    await _box.write(key, value);
  }

  T? get<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  bool has(String key) {
    return _box.hasData(key);
  }

  Future<void> clearAll() async {
    await _box.erase();
  }
}