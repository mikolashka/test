import 'package:auto_route/auto_route.dart';
import 'package:devtools_test/core/validations/validations.dart';
import 'package:devtools_test/presentation/utils/general_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../utils/app_colors.dart';
import '../../utils/general_widgets/simple_input.dart';
import '../bloc/auth_bloc.dart';

@RoutePage(name: RouteNames.auth)
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AuthBloc authBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.errorMessage != null) {}
          if (state.authSuccess == true) {
            context.router.replace(const MainRoute());
          }
        },
        bloc: authBloc,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                SimpleInputLayout(
                  title: 'Email',
                  icon: const Icon(Icons.email),
                  controller: emailController,
                  validator: Validations.validationEmail,
                ),
                const SizedBox(height: 20.0),
                SimpleInputLayout(
                  title: 'Пароль',
                  icon: const Icon(Icons.lock),
                  obscureText: true,
                  controller: passwordController,
                  validator: Validations.validationPassword,
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryElevationButton(
                    title: 'Войти',
                    onPressed: () {
                      authBloc.add(LoginPersonEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context));
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: SecondaryElevationButton(
                    title: 'Зарегистрироваться',
                    bgColor: AppColors.grey,
                    onPressed: () => context.router.push(const RegisterRoute()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
