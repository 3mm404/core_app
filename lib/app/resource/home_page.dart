import 'package:core_app/app/controller/authController.dart';
import 'package:core_app/app/controller/profileController.dart';
import 'package:core_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<ProfileController> {
  const HomePage({super.key});

  AuthController get authController => Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading) {
            return const CircularProgressIndicator();
          }

          if (controller.hasError) {
            return Text(controller.errorMessage.value);
          }

          final sessionUser = authController.session.user.value;
          final user = controller.user.value ?? sessionUser;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido, ${user?.name ?? 'Usuario'}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('Email: ${user?.email ?? '-'}'),
              const SizedBox(height: 8),
              Text('Rol: ${user?.role ?? '-'}'),
              const SizedBox(height: 8),
              Text('Estado: ${user?.status ?? '-'}'),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () async {
                  await authController.logout();
                  Get.offAllNamed(AppRoutes.login);
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
