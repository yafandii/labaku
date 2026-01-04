part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class ChangeIndexEvent extends HomeEvent {
  final int index;
  ChangeIndexEvent(this.index);
}