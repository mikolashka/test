part of 'initial_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetTokenEvent extends AuthEvent {

  const GetTokenEvent();

  @override
  List<Object> get props => [];
}
