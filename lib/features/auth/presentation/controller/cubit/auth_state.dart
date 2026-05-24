import 'package:booking_app/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess(this.user);

  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  const AuthError(this.messageKey);

  final String messageKey;

  @override
  List<Object?> get props => [messageKey];
}
