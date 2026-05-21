part of 'kitton.dart';

extension KittonSerialization on Kitton {
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>.from(data);

    for (final key in hidden) {
      json.remove(key);
    }

    if (visible.isNotEmpty) {
      json = {
        for (final key in visible)
          if (json.containsKey(key)) key: json[key],
      };
    }

    return json;
  }
}