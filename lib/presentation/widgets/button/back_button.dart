import 'dart:io';

import 'package:boilerplate/data/constant/app_color.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  final Function? onPressed;
  const ButtonBack({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: IconButton(
        onPressed: () => onPressed ?? Navigator.pop(context),
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: AppColor.primaryColor,
          size: 24,
        ),
      ),
    );
  }
}
