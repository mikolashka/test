import 'package:auto_route/auto_route.dart';
import 'package:devtools_test/core/validations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../utils/general_widgets/primary_button.dart';
import '../../utils/general_widgets/simple_input.dart';
import '../bloc/auth_bloc.dart';

@RoutePage(name: RouteNames.register)
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SimpleInputLayout(
                title: 'Email',
                icon: const Icon(Icons.email),
                validator: Validations.validationEmail,
                controller: emailController,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SimpleInputLayout(
                  title: 'Пароль',
                  icon: const Icon(Icons.lock),
                  validator: Validations.validationPassword,
                  obscureText: true,
                  controller: passwordController,
                )),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: PrimaryElevationButton(
                  title: 'Зарегистрироваться',
                  onPressed: _registerButtonClick,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerButtonClick() {
    if (!_formKey.currentState!.validate()) return;
    authBloc.add(RegisterEvent(
        email: emailController.text, password: passwordController.text, context: context));
  }
}
