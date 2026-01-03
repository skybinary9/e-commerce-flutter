import 'package:ecommerce_final_year_project/common/widgets/text/brand_title_text.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ETexBranWithVerifyIcon extends StatelessWidget {
  const ETexBranWithVerifyIcon({
    super.key,
    required this.tilte,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = MegamartColors.primary,
    this.textAlign = TextAlign.start,
    this.brandTextSizes = TextSize.small,
  });

  final String tilte;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSize brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EBrandTitleText(
          title: tilte,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSizes: brandTextSizes,
        ),
        const SizedBox(width: 4), // 👈 tight gap
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: 14, // 👈 Nike ke size ke match me
        ),
      ],
    );
  }
}
