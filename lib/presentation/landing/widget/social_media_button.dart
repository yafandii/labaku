import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/data/constant/app_font.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final Color? color;
  final String title;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final String icon;
  const SocialMediaButton({
    this.color,
    required this.title,
    this.textStyle,
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColor.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side:
                BorderSide(color: AppColor.primaryColor.withValues(alpha: 0.2)),
          ),
          elevation: 1,
          shadowColor: AppColor.primaryColor,
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(icon), height: 28),
            const SizedBox(width: 8),
            Text(
              title,
              style: textStyle ??
                  AppFont.text14SemiBold.copyWith(color: AppColor.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
