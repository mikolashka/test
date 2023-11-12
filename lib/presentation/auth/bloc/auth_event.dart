part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginPersonEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginPersonEvent({required this.email, required this.password, required this.context});

  @override
  List<Object> get props => [email, password, context];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const RegisterEvent({required this.email, required this.password, required this.context});

  @override
  List<Object> get props => [email, password, context];
}
