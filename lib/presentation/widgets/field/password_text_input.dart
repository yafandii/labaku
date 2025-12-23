import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/presentation/widgets/field/base_text_input.dart';
import 'package:flutter/material.dart';

class PasswordTextInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChange;
  final TextInputAction? textInputAction;

  const PasswordTextInput({
    super.key,
    required this.controller,
    required this.onChange,
    this.textInputAction,
  });
  @override
  State<PasswordTextInput> createState() => _PasswordTextInputState();
}

class _PasswordTextInputState extends State<PasswordTextInput> {
  final FocusNode _focus = FocusNode();
  bool _isFocus = false;
  bool _isVisible = false;

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    setState(() => _isFocus = !_isFocus);
  }

  void _passwordToggle() {
    setState(() => _isVisible = !_isVisible);
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextInput(
      textFieldController: widget.controller,
      label: "Password",
      obsecure: !_isVisible,
      onChanged: widget.onChange,
      textInputType: TextInputType.visiblePassword,
      showIconPrefix: true,
      borderRadius: 10,
      maxLines: 1,
      minLines: 1,
      showIconSuffix: true,
      focusNode: _focus,
      suffixWidget: IconButton(
        onPressed: _passwordToggle,
        icon: Icon(
          _isVisible ? Icons.visibility : Icons.visibility_off,
          color: _isFocus || widget.controller.text.isNotEmpty
              ? AppColor.primaryColor
              : AppColor.primaryColor.withValues(alpha: .5),
        ),
      ),
      prefixIcon: Icons.lock,
      textInputAction: widget.textInputAction,
    );
  }
}
