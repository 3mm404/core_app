import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/app/screens/auth/providers/loginProvider.dart';
import 'package:core_app/core/getx/basecontroller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Logincontroller extends BaseControllerV2 {
  final LoginProviders loginprovider;
  final Session session;

  Logincontroller(this.loginprovider, this.session);
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> login(String email, String password) async {
    await runGuarded(() async {
      await loginprovider.login(
        email: email,
        password: password,
      );
      setSuccess();
     Get.offAllNamed(AppRoutes.home);
    });
  }

}