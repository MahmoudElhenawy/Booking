import 'package:booking_app/features/auth/data/datasource/fake_auth_repository.dart';
import 'package:booking_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:booking_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:booking_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:booking_app/features/auth/presentation/controller/cubit/auth_cubit.dart';

class AuthDi {
  static final FakeAuthDataSource _dataSource = FakeAuthDataSource();

  static AuthCubit createAuthCubit() {
    final repository = AuthRepositoryImpl(_dataSource);
    final loginUseCase = LoginUseCase(repository);
    final registerUseCase = RegisterUseCase(repository);

    return AuthCubit(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
    );
  }
}
