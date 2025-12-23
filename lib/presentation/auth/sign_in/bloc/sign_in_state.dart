part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final bool isChecked;
  const SignInState({
    this.isChecked = false,
  });

  copyWith({
    bool? isChecked,
  }) =>
      SignInState(
        isChecked: isChecked ?? this.isChecked,
      );
  @override
  List<Object?> get props => [
        isChecked,
      ];
}
