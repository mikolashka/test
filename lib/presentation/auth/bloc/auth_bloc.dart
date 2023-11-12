import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/wrapped.dart';
import '../../../data/repository/repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository repository;

  AuthBloc({required this.repository}) : super(const AuthState()) {
    on<LoginPersonEvent>(_onLoginPersonEvent);
    on<RegisterEvent>(_onRegisterEvent);
  }

  void _onLoginPersonEvent(
    LoginPersonEvent event,
    Emitter<AuthState> emit,
  ) async {
    final password = event.password.trim();
    final email = event.email.trim();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (FirebaseAuth.instance.currentUser != null) {
      emit(state.copyWith(authSuccess: true));
    }
  }

  void _onRegisterEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    final password = event.password.trim();
    final email = event.email.trim();
    final credentional = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credentional.credential?.accessToken != null) {
      emit(state.copyWith(authSuccess: true));
    }
  }
}
