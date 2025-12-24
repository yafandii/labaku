import 'package:labaku/data/constant/app_assets.dart';
import 'package:labaku/data/constant/app_color.dart';
import 'package:labaku/data/constant/app_font.dart';
import 'package:labaku/data/models/grid_menu_model.dart';
import 'package:flutter/material.dart';

class ItemGridMenu extends StatelessWidget {
  final GridMenuModel menu;
  final Function() onTap;
  const ItemGridMenu({
    required this.menu,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        color: AppColor.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              menu.icon ?? AppAssets.others,
              height: 32,
            ),
            const SizedBox(height: 8),
            Text(
              menu.title ?? "-",
              textAlign: TextAlign.center,
              style: AppFont.text10SemiBold
                  .copyWith(color: AppColor.secondaryColor),
            )
          ],
        ),
      ),
    );
  }
}
