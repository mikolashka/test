import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devtools_test/data/models/operation_type.dart';
import 'package:devtools_test/data/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/main_screen_model.dart';
import '../models/transaction_model.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl();

  @override
  Future<MainScreenModel> fetchUserTransactions() async {
    final db = FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid);
    final snapshot = await db.get();
    final result =
        snapshot.docs.map((e) => TransactionModel.fromJson(e.data()).setId(e.id)).toList();
    int totalSum = _getTotalSum(result);

    return MainScreenModel(
      replenishmentPercent: _getPercentReplenishment(result, totalSum),
      transferPercent: _getPercentTransfer(result, totalSum),
      withdrawalPercent: _getPercentWithdrawal(result, totalSum),
      transactionList: result,
    );
  }

  double _getPercentReplenishment(List<TransactionModel> transactionList, int totalSum) {
    int sum = 0;
    for (var e in transactionList) {
      if (e.operationType == OperationType.replenishment) {
        final total = int.tryParse(e.total);
        sum += total ?? 0;
      }
    }
    return sum / totalSum * 100;
  }

  double _getPercentTransfer(List<TransactionModel> transactionList, int totalSum) {
    int sum = 0;
    for (var e in transactionList) {
      if (e.operationType == OperationType.transfer) {
        final total = int.tryParse(e.total);
        sum += total ?? 0;
      }
    }
    return sum / totalSum * 100;
  }

  double _getPercentWithdrawal(List<TransactionModel> transactionList, int totalSum) {
    int sum = 0;
    for (var e in transactionList) {
      if (e.operationType == OperationType.withdrawal) {
        final total = int.tryParse(e.total);
        sum += total ?? 0;
      }
    }
    return sum / totalSum * 100;
  }

  int _getTotalSum(List<TransactionModel> transactionList) {
    int sum = 0;
    for (var e in transactionList) {
      final total = int.tryParse(e.total);
      sum += total ?? 0;
    }
    return sum;
  }

  @override
  Future<void> createTransactionModel(TransactionModel transactionModel) async {
    final db = FirebaseFirestore.instance;
    await db.collection(FirebaseAuth.instance.currentUser!.uid).add(transactionModel.toJson());
  }

  @override
  Future<bool> deleteItem(String id) async {
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(id)
        .delete();
    return true;
  }
}
