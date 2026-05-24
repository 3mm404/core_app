import 'package:core_app/app/modules/auth/repositories/auth_repository.dart';
import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/core/auth/session.dart';
import 'package:core_app/core/getx/basecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends BaseControllerV2 {
  final AuthRepository repository;
  final Session session;

  AuthController(this.repository, this.session);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> submitLogin() async {
    await login(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
    );

    if (isSuccess) {
      Get.offAllNamed(AppRoutes.home);
    }

    if (hasError) {
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await runGuarded(() async {
      final user = await repository.login(
        email: email,
        password: password,
      );

      session.set(user);

      setSuccess();
    });
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await runGuarded(() async {
      final user = await repository.register(
        name: name,
        email: email,
        password: password,
      );

      session.set(user);

      setSuccess();
    });
  }

  Future<void> logout() async {
    await runGuarded(() async {
      await repository.logout();

      session.clear();

      setSuccess();

      Get.offAllNamed(AppRoutes.login);
    });
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();

    super.onClose();
  }
}