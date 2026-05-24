import 'package:booking_app/features/auth/data/datasource/fake_auth_repository.dart';
import 'package:booking_app/features/auth/domain/entities/user_entity.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final FakeAuthDataSource _dataSource;

  @override
  Future<UserEntity> login({required String email, required String password}) {
    return _dataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _dataSource.register(name: name, email: email, password: password);
  }
}
