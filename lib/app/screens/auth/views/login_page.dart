import 'package:core_app/app/screens/auth/controllers/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<Logincontroller> {
  const LoginPage({super.key});

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
                controller: controller.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: controller.passwordCtrl,
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
                    onPressed: controller.emailCtrl.text.isEmpty || controller.passwordCtrl.text.isEmpty
                        ? null
                        : () => controller.login(
                              controller.emailCtrl.text.trim(),
                              controller.passwordCtrl.text.trim(),
                            ),
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