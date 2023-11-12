part of 'initial_bloc.dart';

class InitialState extends Equatable {
  final bool? haveToken;

  const InitialState({this.haveToken});

  @override
  List<Object?> get props => [];

  InitialState copyWith({bool? haveToken}) {
    return InitialState(haveToken: haveToken ?? this.haveToken);
  }
}
