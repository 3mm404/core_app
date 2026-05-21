# Kitton

Lightweight base model system for Flutter/Dart applications.

Kitton helps reduce boilerplate when working with:

- API responses
- Forms
- Local storage
- Nested models
- JSON serialization

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