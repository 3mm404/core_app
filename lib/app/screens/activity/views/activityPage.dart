import 'package:core_app/app/screens/activity/controllers/criptControllers.dart';
import 'package:core_app/app/screens/activity/services/cripService.dart';
import 'package:core_app/app/screens/profile/controllers/profile_controller.dart';
import 'package:core_app/core/session/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityPage extends GetView<ProfileController> {
  ActivityPage({super.key});

  final CryptoController cryptoController = Get.put(
    CryptoController(
      CryptoSocketService(),
    ),
  );

  Session get session => Get.find<Session>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.hasError) {
          return Center(child: Text(controller.errorMessage.value));
        }

        final user = controller.user.value ?? session.user.value;

        return _ActivityContent(
          name: user?.name ?? 'Usuario',
          status: user?.status ?? '-',
          cryptoController: cryptoController,
        );
      }),
    );
  }
}

class _ActivityContent extends StatelessWidget {
  const _ActivityContent({
    required this.name,
    required this.status,
    required this.cryptoController,
  });

  final String name;
  final String status;
  final CryptoController cryptoController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),

            Text(
              'Bienvenido, $name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text('Estado: $status'),

            const SizedBox(height: 32),

            Obx(() {
              final price =
                  double.tryParse(cryptoController.price.value) ?? 0.0;

              final formatted = NumberFormat.currency(
                locale: 'en_US',
                symbol: '\$',
                decimalDigits: 2,
              ).format(price);

              return Text(
                'BTC: $formatted',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),

            const SizedBox(height: 32),

SizedBox(
  height: 300,
  child: Obx(() {
    final history = cryptoController.history.toList();

    if (history.isEmpty) {
      return const Center(
        child: Text('Esperando datos...'),
      );
    }

    return SfCartesianChart(
      primaryXAxis: const NumericAxis(),
      primaryYAxis: const NumericAxis(),
      series: [
        LineSeries<double, int>(
          dataSource: history,
          xValueMapper: (_, index) => index,
          yValueMapper: (price, _) => price,
          animationDuration: 0,
        ),
      ],
    );
  }),
),
          ],
        ),
      ),
    );
  }
}