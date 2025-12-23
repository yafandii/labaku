import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

@injectable
class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(const SplashscreenState()) {
    on<SplashScreenShowLogoAnimationEvent>(
        _onSplashScreenShowLogoAnimationEvent);
  }

  FutureOr<void> _onSplashScreenShowLogoAnimationEvent(
      SplashScreenShowLogoAnimationEvent event,
      Emitter<SplashscreenState> emit) {
    emit(state.copyWith(isShowLogoAnimation: event.isShowLogoAnimation));
  }
}
