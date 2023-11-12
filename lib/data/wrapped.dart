import 'package:equatable/equatable.dart';

class Wrapped<T> extends Equatable {
  final T? value;
  const Wrapped.value(this.value);

  @override
  List<Object?> get props => [value];
}