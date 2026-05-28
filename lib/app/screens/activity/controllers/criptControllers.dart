import 'dart:async';

import 'package:get/get.dart';
import 'package:core_app/app/screens/activity/services/cripService.dart';

class CryptoController extends GetxController {
  final CryptoSocketService service;

  CryptoController(this.service);

  final RxString price = '0.00'.obs;
  final RxList<double> history = <double>[].obs;

  StreamSubscription<String>? _subscription;

  @override
  void onInit() {
    super.onInit();

    _subscription = service.watchBitcoinPrice().listen(
      (value) {
        price.value = value;

        final parsed = double.tryParse(value);

        if (parsed != null) {
          history.add(parsed);

          if (history.length > 30) {
            history.removeAt(0);
          }
        }
      },
      onError: (error) {
        price.value = '0.00';
      },
    );
  }

  @override
  void onClose() {
    _subscription?.cancel();
    service.close();
    super.onClose();
  }
}