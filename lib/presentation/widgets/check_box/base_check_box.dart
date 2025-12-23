import 'package:boilerplate/data/constant/app_color.dart';
import 'package:flutter/material.dart';

class BaseCheckBox extends StatefulWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final Color activeColor;
  final Color borderColor;
  final Color checkColor;
  final double size;

  const BaseCheckBox({
    super.key,
    this.value = false,
    this.onChanged,
    this.activeColor = AppColor.primaryColor,
    this.borderColor = AppColor.secondaryColor,
    this.checkColor = Colors.white,
    this.size = Checkbox.width,
  });

  @override
  State<BaseCheckBox> createState() => _BaseCheckBoxState();
}

class _BaseCheckBoxState extends State<BaseCheckBox> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: widget.borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(4),
          child: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.transparent),
            child: SizedBox(
              width: 16,
              height: 16,
              child: Checkbox(
                value: widget.value,
                onChanged: widget.onChanged,
                activeColor: widget.activeColor,
                checkColor: widget.checkColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
