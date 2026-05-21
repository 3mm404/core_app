/// ---------------------------------------------------------------------------
/// KITTON
/// ---------------------------------------------------------------------------
///
/// Base model system for the application.
///
/// Kitton is designed to reduce boilerplate when working with:
/// - API responses
/// - Forms
/// - Local storage
/// - Nested models
///
/// Inspired by:
/// - Laravel Models
/// - Jackson (Java)
/// - Active Record patterns
///
/// ---------------------------------------------------------------------------
/// PHILOSOPHY
/// ---------------------------------------------------------------------------
///
/// ❌ No huge `fromJson()` methods.
/// ❌ No duplicated DTOs.
/// ❌ No manual parsing everywhere.
/// ❌ No unnecessary boilerplate.
///
/// ✅ One model for requests and responses.
/// ✅ Typed field readers.
/// ✅ Nested model parsing.
/// ✅ Safe field filtering.
/// ✅ Lightweight and explicit.
///
/// ---------------------------------------------------------------------------
/// BASIC EXAMPLE
/// ---------------------------------------------------------------------------
///
/// ```dart
/// class User extends Kitton {
///   User(super.data);
///
///   String get name => string('name');
///
///   String get email => string('email');
/// }
///
/// final user = User({
///   'name': 'Christian',
///   'email': 'test@mail.com',
/// });
///
/// print(user.name);
/// print(user.email);
/// ```
///
/// ---------------------------------------------------------------------------
/// INTERNAL DATA STORAGE
/// ---------------------------------------------------------------------------
///
/// All model values are stored internally in:
///
/// ```dart
/// final Map<String, dynamic> data;
/// ```
///
/// Example:
///
/// ```dart
/// final user = User({
///   'id': 1,
///   'name': 'Christian',
/// });
/// ```
///
/// Internally:
///
/// ```dart
/// data['id']
/// data['name']
/// ```
///
/// ---------------------------------------------------------------------------
/// FIELD READERS
/// ---------------------------------------------------------------------------
///
/// Kitton provides helper methods for safely reading values.
///
/// ---------------------------------------------------------------------------
/// STRING FIELDS
/// ---------------------------------------------------------------------------
///
/// ```dart
/// String get email => string('email');
/// ```
///
/// Automatically:
/// - Reads the value
/// - Converts it into String
/// - Prevents null crashes
///
/// Example:
///
/// ```json
/// {
///   "email": "test@mail.com"
/// }
/// ```
///
/// Result:
///
/// ```dart
/// user.email // test@mail.com
/// ```
///
/// With fallback:
///
/// ```dart
/// string('email', 'unknown@mail.com');
/// ```
///
/// ---------------------------------------------------------------------------
/// INTEGER FIELDS
/// ---------------------------------------------------------------------------
///
/// ```dart
/// int get age => intValue('age');
/// ```
///
/// Supports:
/// - int
/// - double
/// - numeric strings
///
/// Example:
///
/// ```json
/// {
///   "age": "25"
/// }
/// ```
///
/// Result:
///
/// ```dart
/// user.age // 25
/// ```
///
/// ---------------------------------------------------------------------------
/// BOOLEAN FIELDS
/// ---------------------------------------------------------------------------
///
/// ```dart
/// bool get active => boolValue('active');
/// ```
///
/// Supports:
/// - true
/// - false
/// - 1
/// - 0
/// - "true"
/// - "1"
///
/// Example:
///
/// ```json
/// {
///   "active": "true"
/// }
/// ```
///
/// Result:
///
/// ```dart
/// user.active // true
/// ```
///
/// ---------------------------------------------------------------------------
/// DATE FIELDS
/// ---------------------------------------------------------------------------
///
/// Recommended pattern:
///
/// ```dart
/// DateTime? get createdAt {
///   final value = string('created_at');
///
///   if (value.isEmpty) return null;
///
///   return DateTime.tryParse(value);
/// }
/// ```
///
/// Example:
///
/// ```json
/// {
///   "created_at": "2026-05-20T12:00:00Z"
/// }
/// ```
///
/// Result:
///
/// ```dart
/// user.createdAt
/// ```
///
/// ---------------------------------------------------------------------------
/// NESTED MODELS
/// ---------------------------------------------------------------------------
///
/// Kitton supports nested models.
///
/// Example response:
///
/// ```json
/// {
///   "user": {
///     "name": "Christian"
///   },
///   "token": "abc123"
/// }
/// ```
///
/// Example:
///
/// ```dart
/// class Auth extends Kitton {
///   Auth(super.data);
///
///   User? get user => model<User>(
///     'user',
///     User.new,
///   );
///
///   String get token => string('token');
/// }
/// ```
///
/// Usage:
///
/// ```dart
/// final auth = Auth(response.data);
///
/// print(auth.user?.name);
/// print(auth.token);
/// ```
///
/// ---------------------------------------------------------------------------
/// LIST OF MODELS
/// ---------------------------------------------------------------------------
///
/// Example response:
///
/// ```json
/// {
///   "users": [
///     { "name": "Christian" },
///     { "name": "Ana" }
///   ]
/// }
/// ```
///
/// Example:
///
/// ```dart
/// List<User> get users => models<User>(
///   'users',
///   User.new,
/// );
/// ```
///
/// Usage:
///
/// ```dart
/// auth.users.first.name
/// ```
///
/// ---------------------------------------------------------------------------
/// FIELD FILTERING
/// ---------------------------------------------------------------------------
///
/// Kitton can safely filter fields before sending data to APIs.
///
/// Similar to Laravel's:
///
/// ```php
/// protected $fillable = [];
/// ```
///
/// ---------------------------------------------------------------------------
/// only()
/// ---------------------------------------------------------------------------
///
/// Returns only specified fields.
///
/// Example:
///
/// ```dart
/// user.only([
///   'email',
///   'password',
/// ]);
/// ```
///
/// Result:
///
/// ```dart
/// {
///   'email': 'test@mail.com',
///   'password': '123456',
/// }
/// ```
///
/// ---------------------------------------------------------------------------
/// fill()
/// ---------------------------------------------------------------------------
///
/// Alias of `only()`.
///
/// Designed to feel similar to Laravel fillable behavior.
///
/// Example:
///
/// ```dart
/// static const login = [
///   'email',
///   'password',
/// ];
///
/// auth.fill(Auth.login);
/// ```
///
/// ---------------------------------------------------------------------------
/// SERIALIZATION
/// ---------------------------------------------------------------------------
///
/// Convert model into JSON.
///
/// ```dart
/// final json = user.toJson();
/// ```
///
/// Result:
///
/// ```dart
/// {
///   'name': 'Christian',
///   'email': 'test@mail.com',
/// }
/// ```
///
/// ---------------------------------------------------------------------------
/// EXAMPLE MODEL
/// ---------------------------------------------------------------------------
///
/// ```dart
/// class User extends Kitton {
///   User(super.data);
///
///   static const login = [
///     'email',
///     'password',
///   ];
///
///   String get id => string('id');
///
///   String get name => string('name');
///
///   String get email => string('email');
///
///   bool get isAdmin => roles == 'admin';
///
///   String get roles => string('roles');
/// }
/// ```
///
/// ---------------------------------------------------------------------------
/// SUMMARY
/// ---------------------------------------------------------------------------
///
/// Kitton replaces:
///
/// ❌ Huge `fromJson()`
/// ❌ Manual mapping
/// ❌ DTO duplication
/// ❌ Boilerplate-heavy models
///
/// With:
///
/// ✅ Lightweight models
/// ✅ Typed accessors
/// ✅ Reusable request/response models
/// ✅ Safer API payload handling
/// ---------------------------------------------------------------------------
abstract class Kitton {