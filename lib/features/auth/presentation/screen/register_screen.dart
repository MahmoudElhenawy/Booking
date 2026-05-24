import 'package:booking_app/core/utils/app_assets.dart';
import 'package:booking_app/core/widgets/custom_button.dart';
import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:booking_app/core/router/app_router.dart';
import 'package:booking_app/features/auth/di/auth_di.dart';
import 'package:booking_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => AuthDi.createAuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.messageKey.tr())));
          }

          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('register_success'.tr())));
            context.go(AppRouter.root);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Image.asset(AssetsData.logo, width: 180, height: 180),

                    Text(
                      "create_account".tr(),

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "register_subtitle".tr(),

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 40),

                    CustomTextField(
                      controller: _nameController,
                      hintText: 'enter_your_full_name'.tr(),

                      labelText: 'full_name'.tr(),
                      validator: (value) {
                        if ((value ?? '').trim().isEmpty) {
                          return 'required_field'.tr();
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

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

                    const SizedBox(height: 20),

                    CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: 'confirm_your_password'.tr(),

                      labelText: 'confirm_password'.tr(),

                      isPassword: true,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'required_field'.tr();
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),

                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: CircularProgressIndicator(),
                          );
                        }

                        return CustomButton(
                          text: 'register'.tr(),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            context.read<AuthCubit>().register(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    TextButton(
                      onPressed: () => context.go(AppRouter.root),
                      child: Text('already_have_account'.tr()),
                    ),

                    const SizedBox(height: 30),
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
