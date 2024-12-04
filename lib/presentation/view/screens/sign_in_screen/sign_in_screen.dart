import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_tech_task/presentation/state/auth/auth_cubit.dart';
import 'package:lanars_tech_task/core/constants/app_strings.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/core/utils/validation_utils.dart';
import 'package:lanars_tech_task/presentation/state/user/user_cubit.dart';
import 'package:lanars_tech_task/presentation/view/screens/sign_in_screen/widgets/auth_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isFormValidating = false;

  Future<void> _validateForm(
    BuildContext context,
    String email,
    String password,
  ) async {
    setState(() {
      _isFormValidating = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().signIn();
      context.read<UserCubit>().fetchUserData(email, password);
    } else {
      setState(() {
        _isFormValidating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 150),
                _title(),
                const SizedBox(height: 72),
                _emailTextField(),
                const SizedBox(height: 8),
                _passwordTextField(),
                const SizedBox(height: 44),
                _authButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      AppStrings.signIn,
      style: AppTextStyles.titleText,
    );
  }

  Widget _emailTextField() {
    return AuthTextFormField(
      controller: _email,
      label: AppStrings.email,
      hint: AppStrings.enterYourEmail,
      validator: ValidationUtils.validateEmail,
      enabled: !_isFormValidating,
    );
  }

  Widget _passwordTextField() {
    return AuthTextFormField(
      controller: _password,
      label: AppStrings.password,
      hint: AppStrings.enterYourPassword,
      validator: ValidationUtils.validatePassword,
      obscureText: true,
      enabled: !_isFormValidating,
    );
  }

  Widget _authButton(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isFormValidating
            ? null
            : () => _validateForm(
                  context,
                  _email.text,
                  _password.text,
                ),
        child: _isFormValidating
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    color: lightColorScheme.onPrimary),
              )
            : const Text(AppStrings.logIn),
      ),
    );
  }
}
