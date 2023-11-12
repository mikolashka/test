part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String? errorMessage;
  final bool authSuccess;

  const AuthState({this.errorMessage, this.authSuccess = false});

  @override
  List<Object?> get props => [];

  AuthState copyWith({Wrapped<String?>? errorMessage, bool? authSuccess}) {
    return AuthState(
      errorMessage: errorMessage != null ? errorMessage.value : this.errorMessage,
      authSuccess: authSuccess ?? this.authSuccess,
    );
  }
}
