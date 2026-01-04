import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:labaku/domain/usecases/product_usecases/product_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductUsecases productUsecases;

  HomeBloc(this.productUsecases) : super(const HomeState()) {
    on<ChangeIndexEvent>(_changeIndex);
  }

  FutureOr<void> _changeIndex(ChangeIndexEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(activeTabIndex: event.index));
  }
}
