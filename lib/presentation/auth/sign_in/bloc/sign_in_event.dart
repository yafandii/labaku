part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInCheckBoxChangedEvent extends SignInEvent {
  final bool isChecked;

  SignInCheckBoxChangedEvent({required this.isChecked});
}
