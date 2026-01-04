part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int activeTabIndex;

  const HomeState({this.activeTabIndex = 0});

  HomeState copyWith({
    int? activeTabIndex,
  }) =>
      HomeState(activeTabIndex: activeTabIndex ?? this.activeTabIndex);

  @override
  List<Object?> get props => [
        activeTabIndex,
      ];
}
