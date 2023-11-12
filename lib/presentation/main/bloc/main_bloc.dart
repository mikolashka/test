import 'package:devtools_test/data/models/transaction_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/main_screen_model.dart';
import '../../../data/models/operation_type.dart';
import '../../../data/repository/repository.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final Repository repository;

  MainBloc({required this.repository}) : super(const MainState()) {
    on<SaveTransactionEvent>(_onSaveTransactionEvent);
    on<FetchUserTransactionsEvent>(_onFetchUserTransactions);
    on<RemoveItemEvent>(_onRemoveItemEvent);
  }

  void _onSaveTransactionEvent(
    SaveTransactionEvent event,
    Emitter<MainState> emit,
  ) async {
    await repository.createTransactionModel(event.getTransactionModel());
    add(const FetchUserTransactionsEvent());
  }

  void _onFetchUserTransactions(
    FetchUserTransactionsEvent event,
    Emitter<MainState> emit,
  ) async {
    final model = await repository.fetchUserTransactions();
    emit(state.copyWith(model: model));
  }

  void _onRemoveItemEvent(
    RemoveItemEvent event,
    Emitter<MainState> emit,
  ) async {
    final isSuccess = await repository.deleteItem(event.id);
    if(isSuccess) {
      add(const FetchUserTransactionsEvent());
    }
  }
}
