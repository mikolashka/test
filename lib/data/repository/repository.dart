import 'package:devtools_test/data/models/main_screen_model.dart';
import 'package:devtools_test/data/models/transaction_model.dart';

abstract class Repository{
  Future<String?> getAuthToken();
  void saveAuthToken(String token);
  void saveUserId(String id);
  Future<void> createTransactionModel(TransactionModel transactionModel);
  Future<MainScreenModel> fetchUserTransactions();
  Future<bool> deleteItem(String id);
}