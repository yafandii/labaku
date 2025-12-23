import 'package:boilerplate/data/constant/app_font.dart';
import 'package:flutter/material.dart';

class ItemTitleSection extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ItemTitleSection({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title, style: AppFont.text18Bold),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Text(
              "See All",
              style: AppFont.text15SemiBold,
            ),
          )
        ],
      ),
    );
  }
}
