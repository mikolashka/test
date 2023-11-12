part of 'main_bloc.dart';

class MainState extends Equatable {
  final MainScreenModel? model;

  const MainState({this.model});

  @override
  List<Object?> get props => [model];

  MainState copyWith({MainScreenModel? model}) {
    return MainState(model: model ?? this.model);
  }
}
