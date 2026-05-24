class ApiConfig {
  static const String baseUrl = 'https://dockploy.cherbyte.com/api';

  static const String version = '/v1';

  static String path(String endpoint) {
    return '$version$endpoint';
  }
}


class WebSocketConfig {
  static const String baseWssUrl = 'wss://dockploy.cherbyte.com';

  static const String appKey = 'ceDatachas1Aemm';

  static const String host = 'dockploy.cherbyte.com';

  static const int port = 443;

  static const String authEndpoint = '/api/broadcasting/auth';
}

class AuthRoutes {
  static String get login => ApiConfig.path('/login');

  static String get register => ApiConfig.path('/register');

  static String get verifyEmail => ApiConfig.path('/verify-email');

  static String get logout => ApiConfig.path('/logout');

  static String get forgotPassword => ApiConfig.path('/forgot-password');

  static String get resetPassword => ApiConfig.path('/reset-password');
}

class UserProfile {
  static String get profile => ApiConfig.path('/profile');
}