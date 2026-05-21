import 'package:core_app/app/controller/authController.dart';
import 'package:core_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                if (controller.isLoading) {
                  return const CircularProgressIndicator();
                }

                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.login(
                        email: emailCtrl.text.trim(),
                        password: passwordCtrl.text.trim(),
                      );

                      if (controller.isSuccess) {
                        Get.offAllNamed(AppRoutes.home);
                      }

                      if (controller.hasError) {
                        Get.snackbar(
                          'Error',
                          controller.errorMessage.value,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
