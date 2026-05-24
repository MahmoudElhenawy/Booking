import 'package:booking_app/features/auth/domain/entities/user_entity.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class RegisterUseCase {
  RegisterUseCase(this._repository);

  final AuthRepository _repository;

  Future<UserEntity> call(RegisterParams params) {
    return _repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}
