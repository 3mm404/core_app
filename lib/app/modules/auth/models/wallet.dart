

import 'package:kitton/kitton.dart';

class Wallet extends Kitton {
  Wallet(super.data);

  num get balance => data['balance'] ?? 0;

  num get reserved => data['reserved'] ?? 0;
}
