part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpCheckBoxChangedEvent extends SignUpEvent {
  final bool isChecked;

  SignUpCheckBoxChangedEvent({required this.isChecked});
}
