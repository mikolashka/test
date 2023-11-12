import 'package:json_annotation/json_annotation.dart';

import 'operation_type.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String? id;
  final String dateTransaction;
  final String sum;
  final String commission;
  final String total;
  final String numberTransaction;
  final OperationType operationType;

  const TransactionModel({this.id,
    required this.dateTransaction,
    required this.sum,
    required this.commission,
    required this.total,
    required this.numberTransaction,
    required this.operationType});

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel setId(String id) {
    return TransactionModel(
        id: id,
        dateTransaction: dateTransaction,
        sum: sum,
        commission: commission,
        total: total,
        numberTransaction: numberTransaction,
        operationType: operationType
    );
  }
}
