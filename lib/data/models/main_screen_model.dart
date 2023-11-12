import 'package:devtools_test/data/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

class MainScreenModel extends Equatable {
  final double replenishmentPercent;
  final double transferPercent;
  final double withdrawalPercent;
  final List<TransactionModel> transactionList;

  const MainScreenModel({
    required this.replenishmentPercent,
    required this.transferPercent,
    required this.withdrawalPercent,
    required this.transactionList,
  });

  @override
  List<Object?> get props => [
        replenishmentPercent,
        transferPercent,
        withdrawalPercent,
        transactionList,
      ];
}
