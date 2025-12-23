part of 'splashscreen_bloc.dart';

class SplashscreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashScreenInitialEvent extends SplashscreenEvent {}

class SplashScreenShowLogoAnimationEvent extends SplashscreenEvent {
  final bool isShowLogoAnimation;

  SplashScreenShowLogoAnimationEvent({required this.isShowLogoAnimation});
}
