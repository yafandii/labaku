part of 'splashscreen_bloc.dart';

class SplashscreenState extends Equatable {
  final bool isShowLogoAnimation;

  const SplashscreenState({this.isShowLogoAnimation = false});

  SplashscreenState copyWith({bool? isShowLogoAnimation}) => SplashscreenState(
      isShowLogoAnimation: isShowLogoAnimation ?? this.isShowLogoAnimation);

  @override
  List<Object?> get props => [
        isShowLogoAnimation,
      ];
}
