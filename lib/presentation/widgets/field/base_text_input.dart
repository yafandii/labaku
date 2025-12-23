import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/data/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextInput extends StatefulWidget {
  final TextEditingController textFieldController;
  final String label;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final Function(String)? onChanged;
  final String? error;
  final double? borderRadius;
  final Color? customBorderColor;
  final Color? focusBorderColor;
  final bool showBorder;
  final bool showIconPrefix;
  final bool showIconSuffix;
  final bool autofocus;
  final bool enabled;
  final bool obsecure;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? limit;
  final VoidCallback? onTap;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final FocusNode? focusNode;

  const BaseTextInput({
    super.key,
    required this.textFieldController,
    required this.label,
    this.onChanged,
    this.textInputType,
    this.textInputAction,
    this.backgroundColor,
    this.error,
    this.borderRadius,
    this.customBorderColor,
    this.focusBorderColor,
    this.showBorder = true,
    this.showIconPrefix = false,
    this.showIconSuffix = false,
    this.autofocus = false,
    this.enabled = true,
    this.obsecure = false,
    this.readOnly = false,
    this.maxLines,
    this.minLines,
    this.limit,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.focusNode,
  });

  @override
  State<BaseTextInput> createState() => _BaseTextInputState();
}

class _BaseTextInputState extends State<BaseTextInput> {
  FocusNode _focus = FocusNode();
  bool isFocus = false;

  @override
  void initState() {
    if (widget.focusNode != null) {
      _focus = widget.focusNode!;
    }
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    setState(() {
      isFocus = !isFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      keyboardType: widget.textInputType ?? TextInputType.text,
      obscureText: widget.obsecure,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      decoration: InputDecoration(
        errorText: widget.error,
        hintText: widget.label,
        fillColor:
            widget.backgroundColor ?? AppColor.grayColor.withValues(alpha: .2),
        hintStyle: AppFont.text13Normal
            .copyWith(color: AppColor.primaryColor.withValues(alpha: .5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorStyle: AppFont.text13Normal.copyWith(color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          borderSide: widget.showBorder
              ? BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: widget.focusBorderColor ?? AppColor.primaryColor,
                )
              : const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10)),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        prefixIcon: widget.showIconPrefix
            ? widget.prefixWidget ??
                Icon(
                  widget.prefixIcon ?? Icons.search,
                  color: isFocus || widget.textFieldController.text.isNotEmpty
                      ? AppColor.primaryColor
                      : AppColor.primaryColor.withValues(alpha: .5),
                )
            : null,
        suffixIcon: widget.showIconSuffix
            ? widget.suffixWidget ??
                Icon(widget.suffixIcon ?? Icons.search,
                    color: isFocus || widget.textFieldController.text.isNotEmpty
                        ? AppColor.primaryColor
                        : AppColor.primaryColor.withValues(alpha: .5))
            : null,
      ),
      style: AppFont.text13Normal.copyWith(color: AppColor.primaryColor),
      controller: widget.textFieldController,
      onTap: widget.onTap,
      cursorColor: AppColor.primaryColor,
      inputFormatters: [LengthLimitingTextInputFormatter(widget.limit ?? 999)],
      readOnly: widget.readOnly,
      focusNode: widget.focusNode ?? _focus,
    );
  }
}
