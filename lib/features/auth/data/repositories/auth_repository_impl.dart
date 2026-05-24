import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/features/auth/data/datasource/fake_auth_repository.dart';
import 'package:booking_app/features/auth/domain/entities/user_entity.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final FakeAuthDataSource _dataSource;

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _dataSource.login(email: email, password: password);
      return Right(user);
    } on AuthException catch (error) {
      return Left(AuthFailure(error.messageKey));
    } catch (_) {
      return const Left(AuthFailure('unknown_error'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _dataSource.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(user);
    } on AuthException catch (error) {
      return Left(AuthFailure(error.messageKey));
    } catch (_) {
      return const Left(AuthFailure('unknown_error'));
    }
  }
}
