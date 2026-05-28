import 'package:core_app/app/screens/activity/controllers/criptControllers.dart';
import 'package:core_app/app/screens/activity/services/cripService.dart';
import 'package:core_app/app/screens/profile/controllers/profile_controller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityPage extends GetView<ProfileController> {
  ActivityPage({super.key});

  /// Controller responsible for listening to the crypto WebSocket.
  final CryptoController cryptoController = Get.put(
    CryptoController(
      CryptoSocketService(),
    ),
  );

  /// Current local session.
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

          final user = controller.user.value ?? session.user.value;

          return _ActivityContent(
            name: user?.name ?? 'Usuario',
            status: user?.status ?? '-',
            btcPrice: cryptoController.price.value,
          );
        }),
      ),
    );
  }
}

class _ActivityContent extends StatelessWidget {
  const _ActivityContent({
    required this.name,
    required this.status,
    required this.btcPrice,
  });

  final String name;
  final String status;
  final String btcPrice;
  //desnign de la pantalla de actividad, muestra el nombre del usuario, su estado y el precio actual del bitcoin en tiempo real.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bienvenido, $name',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        Text('Estado: $status'),

        const SizedBox(height: 32),

        Text(
          'BTC: \$$btcPrice',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}