part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class SaveTransactionEvent extends MainEvent {
  final String dateTransaction;
  final String sum;
  final String commission;
  final String total;
  final String numberTransaction;
  final OperationType operationType;

  const SaveTransactionEvent(
      {required this.dateTransaction,
      required this.sum,
      required this.commission,
      required this.total,
      required this.numberTransaction,
      required this.operationType});

  TransactionModel getTransactionModel() {
    return TransactionModel(
      dateTransaction: dateTransaction,
      sum: sum,
      commission: commission,
      total: total,
      numberTransaction: numberTransaction,
      operationType: operationType,
    );
  }

  @override
  List<Object> get props => [];
}

class FetchUserTransactionsEvent extends MainEvent {
  const FetchUserTransactionsEvent();

  @override
  List<Object> get props => [];
}


class RemoveItemEvent extends MainEvent {
  final String id;
  const RemoveItemEvent(this.id);

  @override
  List<Object> get props => [];
}
