import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.messageKey);

  final String messageKey;

  @override
  List<Object?> get props => [messageKey];
}

class AuthFailure extends Failure {
  const AuthFailure(super.messageKey);
}
