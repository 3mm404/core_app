# Kitton

Lightweight base model system for Flutter/Dart applications.

Kitton helps reduce boilerplate when working with:

- API responses
- Forms
- Local storage
- Nested models
- JSON serialization
- Request payloads
- Model relationships

Inspired by Laravel Models, Jackson, and lightweight Active Record patterns.

---

## Why Kitton?

Kitton is designed to avoid repetitive model code.

Instead of writing large `fromJson()` methods or duplicated DTOs, Kitton stores raw model data in a single `Map<String, dynamic>` and exposes safe typed readers.

### Kitton avoids

- Huge `fromJson()` methods
- Duplicated DTOs
- Manual parsing everywhere
- Unsafe null access
- Repetitive request/response mapping

### Kitton provides

- Typed field readers
- Nested model parsing
- List model parsing
- Safe payload filtering
- JSON serialization
- Reusable request/response models
- Simple relationship handling

---

## Basic Usage

```dart
class User extends Kitton {
  User(super.data);

  String get name => string('name');
  String get email => string('email');
}

final user = User({
  'name': 'Christian',
  'email': 'test@mail.com',
});

print(user.name);
print(user.email);
```

---

## Internal Data

All model values are stored internally in:

```dart
final Map<String, dynamic> data;
```

Example:

```dart
final user = User({
  'id': 1,
  'name': 'Christian',
  'email': 'test@mail.com',
});
```

Values can be accessed safely through helper methods:

```dart
user.string('name');
user.intValue('id');
user.boolValue('active');
```

---

# Typed Field Readers

Kitton provides helper methods to read and convert common data types safely.

---

## String Values

```dart
String get name => string('name');
String get email => string('email');
```

With fallback:

```dart
String get avatar => string('avatar', 'default.png');
```

Example data:

```json
{
  "name": "Christian",
  "email": "test@mail.com",
  "avatar": null
}
```

Usage:

```dart
print(user.name);   // Christian
print(user.email);  // test@mail.com
print(user.avatar); // default.png
```

---

## Integer Values

```dart
int get id => intValue('id');
int get age => intValue('age');
```

Supports:

- `int`
- `double`
- numeric strings
- `null` fallback

Example data:

```json
{
  "id": "10",
  "age": 25
}
```

Usage:

```dart
print(user.id);  // 10
print(user.age); // 25
```

With fallback:

```dart
int get points => intValue('points', 0);
```

---

## Double Values

If your Kitton reader supports doubles, you can use this pattern:

```dart
double get price => doubleValue('price');
double get rating => doubleValue('rating', 0.0);
```

Example data:

```json
{
  "price": "99.50",
  "rating": 4.8
}
```

Usage:

```dart
print(product.price);  // 99.5
print(product.rating); // 4.8
```

If you do not have `doubleValue()` yet, you can add it later as a reader.

---

## Boolean Values

```dart
bool get active => boolValue('active');
bool get verified => boolValue('verified');
```

Supports:

- `true`
- `false`
- `1`
- `0`
- `"true"`
- `"false"`
- `"1"`
- `"0"`

Example data:

```json
{
  "active": "true",
  "verified": 1
}
```

Usage:

```dart
print(user.active);   // true
print(user.verified); // true
```

With fallback:

```dart
bool get isAdmin => boolValue('is_admin', false);
```

---

## Date Values

Kitton keeps date parsing explicit to avoid hidden behavior.

Recommended pattern:

```dart
DateTime? get createdAt {
  final value = string('created_at');

  if (value.isEmpty) return null;

  return DateTime.tryParse(value);
}
```

Example data:

```json
{
  "created_at": "2026-05-20T12:00:00Z"
}
```

Usage:

```dart
print(user.createdAt);
```

---

## Nullable Values

For optional fields, use nullable getters:

```dart
String? get phone {
  final value = string('phone');

  if (value.isEmpty) return null;

  return value;
}
```

Example data:

```json
{
  "phone": null
}
```

Usage:

```dart
print(user.phone); // null
```

---

# Relationships

Kitton can represent relationships between models.

This is useful when your API returns nested objects or lists.

---

## One-to-One Relationship

Example API response:

```json
{
  "id": 1,
  "name": "Christian",
  "profile": {
    "bio": "Flutter developer",
    "avatar": "avatar.png"
  }
}
```

Profile model:

```dart
class Profile extends Kitton {
  Profile(super.data);

  String get bio => string('bio');
  String get avatar => string('avatar');
}
```

User model:

```dart
class User extends Kitton {
  User(super.data);

  int get id => intValue('id');
  String get name => string('name');

  Profile? get profile => model<Profile>(
        'profile',
        Profile.new,
      );
}
```

Usage:

```dart
final user = User(response.data);

print(user.name);
print(user.profile?.bio);
print(user.profile?.avatar);
```

---

## Auth Relationship Example

Example API response:

```json
{
  "token": "abc123",
  "user": {
    "id": 1,
    "name": "Christian",
    "email": "test@mail.com"
  }
}
```

Auth model:

```dart
class Auth extends Kitton {
  Auth(super.data);

  String get token => string('token');

  User? get user => model<User>(
        'user',
        User.new,
      );
}
```

User model:

```dart
class User extends Kitton {
  User(super.data);

  int get id => intValue('id');
  String get name => string('name');
  String get email => string('email');
}
```

Usage:

```dart
final auth = Auth(response.data);

print(auth.token);
print(auth.user?.name);
print(auth.user?.email);
```

---

## One-to-Many Relationship

Example API response:

```json
{
  "id": 1,
  "name": "Christian",
  "posts": [
    {
      "id": 10,
      "title": "First post"
    },
    {
      "id": 11,
      "title": "Second post"
    }
  ]
}
```

Post model:

```dart
class Post extends Kitton {
  Post(super.data);

  int get id => intValue('id');
  String get title => string('title');
}
```

User model:

```dart
class User extends Kitton {
  User(super.data);

  int get id => intValue('id');
  String get name => string('name');

  List<Post> get posts => models<Post>(
        'posts',
        Post.new,
      );
}
```

Usage:

```dart
final user = User(response.data);

for (final post in user.posts) {
  print(post.title);
}
```

---

## Nested List Relationship

Example API response:

```json
{
  "id": 1,
  "title": "Flutter Roadmap",
  "comments": [
    {
      "id": 1,
      "body": "Great post",
      "user": {
        "id": 2,
        "name": "Ana"
      }
    }
  ]
}
```

User model:

```dart
class User extends Kitton {
  User(super.data);

  int get id => intValue('id');
  String get name => string('name');
}
```

Comment model:

```dart
class Comment extends Kitton {
  Comment(super.data);

  int get id => intValue('id');
  String get body => string('body');

  User? get user => model<User>(
        'user',
        User.new,
      );
}
```

Post model:

```dart
class Post extends Kitton {
  Post(super.data);

  int get id => intValue('id');
  String get title => string('title');

  List<Comment> get comments => models<Comment>(
        'comments',
        Comment.new,
      );
}
```

Usage:

```dart
final post = Post(response.data);

print(post.title);
print(post.comments.first.body);
print(post.comments.first.user?.name);
```

---

# Request Payloads

Kitton can also be used to prepare safe request data.

---

## only()

Use `only()` to return only selected fields.

```dart
final payload = user.only([
  'email',
  'password',
]);
```

Result:

```dart
{
  'email': 'test@mail.com',
  'password': '123456',
}
```

---

## fill()

`fill()` is an alias of `only()`.

It is useful when you want Laravel-style field groups.

```dart
class Auth extends Kitton {
  Auth(super.data);

  static const loginFields = [
    'email',
    'password',
  ];

  static const registerFields = [
    'name',
    'email',
    'password',
    'password_confirmation',
  ];
}
```

Usage:

```dart
final auth = Auth({
  'email': 'test@mail.com',
  'password': '123456',
  'remember': true,
});

final payload = auth.fill(Auth.loginFields);
```

Result:

```dart
{
  'email': 'test@mail.com',
  'password': '123456',
}
```

---

## Login Payload Example

```dart
class LoginRequest extends Kitton {
  LoginRequest(super.data);

  static const fields = [
    'email',
    'password',
  ];

  String get email => string('email');
  String get password => string('password');

  Map<String, dynamic> toPayload() => fill(fields);
}
```

Usage:

```dart
final request = LoginRequest({
  'email': 'test@mail.com',
  'password': '123456',
});

await api.post(
  '/login',
  data: request.toPayload(),
);
```

---

## Register Payload Example

```dart
class RegisterRequest extends Kitton {
  RegisterRequest(super.data);

  static const fields = [
    'name',
    'email',
    'password',
    'password_confirmation',
  ];

  String get name => string('name');
  String get email => string('email');
  String get password => string('password');
  String get passwordConfirmation => string('password_confirmation');

  Map<String, dynamic> toPayload() => fill(fields);
}
```

Usage:

```dart
final request = RegisterRequest({
  'name': 'Christian',
  'email': 'test@mail.com',
  'password': '123456',
  'password_confirmation': '123456',
});

await api.post(
  '/register',
  data: request.toPayload(),
);
```

---

# Serialization

Convert the model back to JSON:

```dart
final json = user.toJson();
```

Example:

```dart
final user = User({
  'id': 1,
  'name': 'Christian',
  'email': 'test@mail.com',
});

print(user.toJson());
```

Result:

```dart
{
  'id': 1,
  'name': 'Christian',
  'email': 'test@mail.com',
}
```

---

# Complete Example

```dart
class User extends Kitton {
  User(super.data);

  static const loginFields = [
    'email',
    'password',
  ];

  int get id => intValue('id');
  String get name => string('name');
  String get email => string('email');
  String get role => string('role');

  bool get isAdmin => role == 'admin';

  Profile? get profile => model<Profile>(
        'profile',
        Profile.new,
      );

  List<Post> get posts => models<Post>(
        'posts',
        Post.new,
      );
}
```

```dart
class Profile extends Kitton {
  Profile(super.data);

  String get bio => string('bio');
  String get avatar => string('avatar');
}
```

```dart
class Post extends Kitton {
  Post(super.data);

  int get id => intValue('id');
  String get title => string('title');
}
```

Usage:

```dart
final user = User(response.data);

print(user.name);
print(user.profile?.bio);

for (final post in user.posts) {
  print(post.title);
}
```

---

# Example API Flow

```dart
final auth = Auth({
  'email': 'test@mail.com',
  'password': '123456',
});

final response = await api.post(
  '/login',
  data: auth.fill(Auth.loginFields),
);

final session = Auth(response.data);

print(session.token);
print(session.user?.name);
```

---

# Summary

Kitton replaces repetitive model mapping with a small, explicit, and reusable base model system.

Use it when you want:

- Cleaner models
- Safer field access
- Less boilerplate
- Reusable request/response objects
- Simple nested model parsing
- Easier API payload handling
- Relationship-style models