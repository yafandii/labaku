import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInCheckBoxChangedEvent>(_onCheckBoxChanged);
  }

  void _onCheckBoxChanged(
      SignInCheckBoxChangedEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(isChecked: event.isChecked));
  }
}
