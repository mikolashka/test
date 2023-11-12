import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/repository.dart';

part 'initial_event.dart';

part 'initial_state.dart';

class InitialBloc extends Bloc<AuthEvent, InitialState> {
  final Repository repository;

  InitialBloc({required this.repository}) : super(const InitialState()) {
    on<GetTokenEvent>(_onGetTokenEvent);
  }


  void _onGetTokenEvent(
      GetTokenEvent event,
    Emitter<InitialState> emit,
  ) async {
    emit(state.copyWith(haveToken: FirebaseAuth.instance.currentUser != null));
  }
}
