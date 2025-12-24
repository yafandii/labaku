import 'package:labaku/data/constant/app_color.dart';
import 'package:labaku/data/constant/app_font.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Color? color;
  final String? title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  const BaseButton(
      {this.color, this.title, this.textStyle, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        shadowColor: AppColor.primaryColor,
      ),
      onPressed: onTap ?? () {},
      child: Text(
        title ?? "Submit",
        style: textStyle ??
            AppFont.text14Normal.copyWith(color: AppColor.backgroundColor),
      ),
    );
  }
}
