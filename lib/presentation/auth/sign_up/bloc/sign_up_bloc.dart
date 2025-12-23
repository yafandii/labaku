import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpCheckBoxChangedEvent>(_onCheckBoxChanged);
  }

  void _onCheckBoxChanged(
      SignUpCheckBoxChangedEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isChecked: event.isChecked));
  }
}
