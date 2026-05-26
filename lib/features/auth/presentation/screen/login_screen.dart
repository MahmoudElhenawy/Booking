import 'package:booking_app/core/utils/app_assets.dart';
import 'package:booking_app/core/widgets/botton_change_language.dart';
import 'package:booking_app/core/widgets/custom_button.dart';
import 'package:booking_app/core/widgets/custom_snack_bar.dart';
import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:booking_app/core/router/app_router.dart';
import 'package:booking_app/features/auth/di/auth_di.dart';
import 'package:booking_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return BlocProvider<AuthCubit>(
      create: (_) => AuthDi.createAuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            CustomSnackBar.error(context, message: state.messageKey.tr());
          }

          if (state is AuthSuccess) {
            CustomSnackBar.success(context, message: 'login_success'.tr());

            context.go(AppRouter.homeScreen);
          }
        },
        child: Scaffold(
          key: ValueKey(locale.toString()),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(AssetsData.logo, width: 250, height: 250),

                    Text(
                      "welcome_back".tr(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: _emailController,
                      hintText: 'enter_your_email'.tr(),
                      labelText: 'email'.tr(),
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        final text = value?.trim() ?? '';
                        if (text.isEmpty) {
                          return 'required_field'.tr();
                        }
                        if (!text.contains('@')) {
                          return 'invalid_email'.tr();
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'enter_your_password'.tr(),
                      labelText: 'password'.tr(),
                      isPassword: true,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'required_field'.tr();
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 50),

                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: CircularProgressIndicator(),
                          );
                        }

                        return CustomButton(
                          text: 'login'.tr(),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            context.read<AuthCubit>().login(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    TextButton(
                      onPressed: () => context.go(AppRouter.registerScreen),
                      child: Text('no_account'.tr()),
                    ),

                    const SizedBox(height: 14),
                    const ButtonChangeLanguage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
