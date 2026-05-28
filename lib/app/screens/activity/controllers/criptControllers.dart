import 'dart:async';

import 'package:core_app/app/screens/activity/services/cripService.dart';
import 'package:get/get.dart';

class CryptoController extends GetxController {
  final CryptoSocketService service;

  CryptoController(this.service);

  final price = '0.00'.obs;

  StreamSubscription<String>? _subscription;

  @override
  void onInit() {
    super.onInit();

    _subscription = service.watchBitcoinPrice().listen((value) {
      price.value = value;
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    service.close();
    super.onClose();
  }
}