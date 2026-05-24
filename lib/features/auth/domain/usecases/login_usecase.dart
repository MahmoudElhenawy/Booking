import 'package:booking_app/features/auth/domain/entities/user_entity.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<UserEntity> call(LoginParams params) {
    return _repository.login(email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
