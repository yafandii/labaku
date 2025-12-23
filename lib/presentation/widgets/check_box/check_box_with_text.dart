import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/data/constant/app_font.dart';
import 'package:boilerplate/presentation/widgets/check_box/base_check_box.dart';
import 'package:flutter/material.dart';

class CheckBoxText extends StatefulWidget {
  final bool val;
  final String? title;
  final Color activeColor;
  final Color inActiveColor;
  final Color checkColor;
  final double space;
  final Axis direction;
  final bool enable;
  final bool showCheckBox;
  final Widget? customDescription;
  final Function(bool)? onChange;

  const CheckBoxText({
    super.key,
    this.val = false,
    this.onChange,
    this.title,
    this.space = 4.0,
    this.direction = Axis.horizontal,
    this.activeColor = AppColor.primaryColor,
    this.inActiveColor = AppColor.grayColor,
    this.enable = true,
    this.showCheckBox = true,
    this.checkColor = Colors.white,
    this.customDescription,
  });

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _changeCheck(!widget.val),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCheckBox(),
          SizedBox(width: widget.showCheckBox ? 10 : 0),
          Flexible(
            child: widget.customDescription != null
                ? widget.customDescription!
                : Text(
                    widget.title ?? '',
                    style: AppFont.text12SemiBold,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckBox() {
    return widget.showCheckBox
        ? BaseCheckBox(
            activeColor: widget.activeColor,
            checkColor: widget.checkColor,
            value: widget.val,
            size: 16,
            onChanged: (value) => _changeCheck(value ?? false),
          )
        : Container();
  }

  _changeCheck(bool check) {
    if (widget.enable && widget.onChange != null) {
      setState(() => widget.onChange!(check));
    }
  }
}
