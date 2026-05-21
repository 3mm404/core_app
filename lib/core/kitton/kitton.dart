part 'kitton_readers.dart';
part 'kitton_relations.dart';
part 'kitton_filters.dart';
part 'kitton_serialization.dart';

/// Base class for application models.
/// Clase base para los modelos de la aplicación.
///
/// Provides shared access to raw data, typed readers,
/// nested model helpers, filtering and JSON serialization.
///
/// Provee acceso compartido a los datos crudos, lectores tipados,
/// helpers para modelos anidados, filtros y serialización JSON.
///
/// Example / Ejemplo:
/// ```dart
/// class User extends Kitton {
///   User(super.data);
///
///   String get email => string('email');
/// }
/// ```
abstract class Kitton {
  /// Raw model data.
  /// Datos crudos del modelo.
  final Map<String, dynamic> data;

  /// Creates a model from a JSON-like map.
  /// Crea un modelo desde un mapa tipo JSON.
  ///
  /// The map is cloned to prevent external mutation.
  /// El mapa se clona para evitar mutaciones externas.
  Kitton(Map<String, dynamic> data)
      : data = Map<String, dynamic>.from(data);

  /// Fields excluded from [toJson].
  /// Campos excluidos de [toJson].
  List<String> get hidden => const [];

  /// Fields allowed in [toJson].
  /// Campos permitidos en [toJson].
  ///
  /// When empty, all fields are allowed except [hidden].
  /// Cuando está vacío, todos los campos son permitidos excepto [hidden].
  List<String> get visible => const [];

  /// Returns the raw value for [key].
  /// Retorna el valor crudo de [key].
  dynamic get(String key) => data[key];

  /// Returns true when [key] exists and is not null.
  /// Retorna true cuando [key] existe y no es null.
  bool has(String key) => data.containsKey(key) && data[key] != null;

  /// Returns true when [key] does not exist or is null.
  /// Retorna true cuando [key] no existe o es null.
  bool missing(String key) => !has(key);

  /// Returns a readable model representation.
  /// Retorna una representación legible del modelo.
  @override
  String toString() {
    return '${runtimeType.toString()}(${toJson()})';
  }
}