import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final session = Get.find<Session>();

    if (!session.isLoggedIn) {
      return const RouteSettings(name: AppRoutes.login);
    }

    return null;
  }
}

class GuestMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final session = Get.find<Session>();

    if (session.isLoggedIn) {
      return const RouteSettings(name: AppRoutes.home);
    }

    return null;
  }
}