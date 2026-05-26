import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/app/screens/auth/providers/loginProvider.dart';
import 'package:core_app/core/getx/basecontroller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends BaseControllerV2 {
  final LoginProviders loginprovider;
  final Session session;

  Logincontroller(this.loginprovider, this.session);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> login() async {
    await runGuarded(() async {
      final user = await loginprovider.login(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );

      session.set(user);

      Get.offAllNamed(AppRoutes.home);
    });
  }
}