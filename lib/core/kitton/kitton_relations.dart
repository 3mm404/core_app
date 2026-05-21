part of 'kitton.dart';

extension KittonRelations on Kitton {
  T model<T extends Kitton>(
    String key,
    T Function(Map<String, dynamic>) builder,
  ) {
    return builder(map(key));
  }

  T? nullableModel<T extends Kitton>(
    String key,
    T Function(Map<String, dynamic>) builder,
  ) {
    final value = data[key];

    if (value == null) return null;

    if (value is Map) {
      return builder(Map<String, dynamic>.from(value));
    }

    return null;
  }

  List<T> models<T extends Kitton>(
    String key,
    T Function(Map<String, dynamic>) builder,
  ) {
    return list(key)
        .whereType<Map>()
        .map((item) => builder(Map<String, dynamic>.from(item)))
        .toList();
  }
}