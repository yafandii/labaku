part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final bool isChecked;
  const SignUpState({
    this.isChecked = false,
  });

  copyWith({
    bool? isChecked,
  }) =>
      SignUpState(
        isChecked: isChecked ?? this.isChecked,
      );
  @override
  List<Object?> get props => [
        isChecked,
      ];
}
