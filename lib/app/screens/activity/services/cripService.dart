import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class CryptoSocketService {
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@ticker'),
  );

  Stream<String> watchBitcoinPrice() {
    return _channel.stream.map((event) {
      final data = jsonDecode(event);
      return data['c'].toString();
    });
  }

  void close() {
    _channel.sink.close();
  }
}