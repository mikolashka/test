import 'package:json_annotation/json_annotation.dart';

enum OperationType {
  @JsonValue('replenishment')
  replenishment,
  @JsonValue('transfer')
  transfer,
  @JsonValue('withdrawal')
  withdrawal;


  String displayValue() {
    switch (this) {
      case OperationType.replenishment:
        return 'Пополнение';
      case OperationType.transfer:
        return 'Перевод';
      case OperationType.withdrawal:
        return 'Снятие';
    }
  }
}