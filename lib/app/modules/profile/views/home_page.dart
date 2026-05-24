import 'package:core_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:core_app/app/modules/profile/controllers/profile_controller.dart';
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

          final profileUser = controller.user.value;
          final sessionUser = authController.session.user.value;

          final user = profileUser ?? sessionUser;

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
                onPressed: authController.logout,
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