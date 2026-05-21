part of 'kitton.dart';

extension KittonReaders on Kitton {
  String string(String key, [String fallback = '']) {
    final value = data[key];

    if (value == null) return fallback;

    return value.toString();
  }

  int intValue(String key, [int fallback = 0]) {
    final value = data[key];

    if (value == null) return fallback;

    if (value is int) return value;

    if (value is num) return value.toInt();

    return int.tryParse(value.toString()) ?? fallback;
  }

  double doubleValue(String key, [double fallback = 0.0]) {
    final value = data[key];

    if (value == null) return fallback;

    if (value is double) return value;

    if (value is num) return value.toDouble();

    return double.tryParse(value.toString()) ?? fallback;
  }

  bool boolValue(String key, [bool fallback = false]) {
    final value = data[key];

    if (value == null) return fallback;

    if (value is bool) return value;

    if (value is num) return value != 0;

    if (value is String) {
      final normalized = value.toLowerCase().trim();

      if (['true', '1', 'yes', 'on'].contains(normalized)) {
        return true;
      }

      if (['false', '0', 'no', 'off'].contains(normalized)) {
        return false;
      }
    }

    return fallback;
  }

  DateTime? date(String key) {
    final value = data[key];

    if (value == null) return null;

    if (value is DateTime) return value;

    if (value is String) return DateTime.tryParse(value);

    return null;
  }

  Map<String, dynamic> map(String key) {
    final value = data[key];

    if (value is Map<String, dynamic>) {
      return Map<String, dynamic>.from(value);
    }

    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    return {};
  }

  List<dynamic> list(String key) {
    final value = data[key];

    if (value is List) {
      return List<dynamic>.from(value);
    }

    return [];
  }
}