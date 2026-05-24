import 'package:core_app/app/data/models/user.dart';
import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/app/screens/auth/providers/registerProvider.dart';
import 'package:core_app/core/getx/basecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseControllerV2 {
  final RegisterProvider registerProvider;

  RegisterController(this.registerProvider);

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordConfirmCtrl = TextEditingController();

  Future<void> register() async {
    await runGuarded(() async {
      final request = User({
        'name': nameCtrl.text.trim(),
        'email': emailCtrl.text.trim(),
        'password': passwordCtrl.text.trim(),
        'password_confirmation': passwordConfirmCtrl.text.trim(),
      });

      await registerProvider.register(request);

      setSuccess();

      Get.offAllNamed(AppRoutes.login);
    });
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    passwordConfirmCtrl.dispose();
    super.onClose();
  }
}