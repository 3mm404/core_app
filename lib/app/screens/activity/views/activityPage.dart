import 'package:core_app/app/screens/activity/controllers/criptControllers.dart';
import 'package:core_app/app/screens/activity/services/cripService.dart';
import 'package:core_app/app/screens/auth/controllers/logoutController.dart';
import 'package:core_app/app/screens/profile/controllers/profile_controller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityPage extends GetView<ProfileController> {
  ActivityPage({super.key});

  final CryptoController cryptoController = Get.put(
    CryptoController(
      CryptoSocketService(),
    ),
  );

  LogoutController get logoutController => Get.find<LogoutController>();
  Session get session => Get.find<Session>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
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
          final sessionUser = session.user.value;
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
              Text('Rol: ${user?.role ?? '-'}'),
              Text('Estado: ${user?.status ?? '-'}'),

              const SizedBox(height: 32),

              Obx(() {
                return Text(
                  'BTC: \$${cryptoController.price.value}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),

              const SizedBox(height: 32),

              ElevatedButton.icon(
                onPressed: logoutController.logout,
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