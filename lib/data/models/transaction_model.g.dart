// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String?,
      dateTransaction: json['dateTransaction'] as String,
      sum: json['sum'] as String,
      commission: json['commission'] as String,
      total: json['total'] as String,
      numberTransaction: json['numberTransaction'] as String,
      operationType: $enumDecode(_$OperationTypeEnumMap, json['operationType']),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTransaction': instance.dateTransaction,
      'sum': instance.sum,
      'commission': instance.commission,
      'total': instance.total,
      'numberTransaction': instance.numberTransaction,
      'operationType': _$OperationTypeEnumMap[instance.operationType]!,
    };

const _$OperationTypeEnumMap = {
  OperationType.replenishment: 'replenishment',
  OperationType.transfer: 'transfer',
  OperationType.withdrawal: 'withdrawal',
};
