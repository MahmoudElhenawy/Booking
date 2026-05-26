import 'package:booking_app/features/auth/data/models/user_model.dart';

class AuthException implements Exception {
  AuthException(this.messageKey);

  final String messageKey;
}

class FakeAuthDataSource {
  final Map<String, _FakeUser> _usersByEmail = {
    'mahmoud@example.com': _FakeUser(
      id: '1',
      name: 'Mahmoud Elhenawy',
      email: 'mahmoud@example.com',
      password: '123456',
    ),
  };

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final key = email.trim().toLowerCase();
    final user = _usersByEmail[key];

    if (user == null || user.password != password) {
      throw AuthException('invalid_credentials');
    }

    return UserModel(id: user.id, name: user.name, email: user.email);
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    final key = email.trim().toLowerCase();
    if (_usersByEmail.containsKey(key)) {
      throw AuthException('email_already_exists');
    }

    final created = _FakeUser(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: name.trim(),
      email: key,
      password: password,
    );
    _usersByEmail[key] = created;

    return UserModel(id: created.id, name: created.name, email: created.email);
  }
}

class _FakeUser {
  _FakeUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  final String id;
  final String name;
  final String email;
  final String password;
}
