import 'package:ecommerce_final_year_project/common/widgets/text/brand_title_text.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/enum.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ETexBranWithVerifyIcon extends StatelessWidget{
  const ETexBranWithVerifyIcon({
    super.key, 
    required this.tilte, 
    this.maxLines = 1, 
    this.textColor, 
    this.iconColor = MegamartColors.primary, 
    this.textAlign =TextAlign.center, 
    this.brandTextSizes = TextSize.small,
  });
  final String tilte;
  final int maxLines;
  final Color ? textColor, iconColor;
  final TextAlign ? textAlign;
  final TextSize brandTextSizes;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: 
        EBrandTitleText(
          title: tilte,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSizes: brandTextSizes,
          ),
        ),
        const SizedBox(width: MegamartSize.xS,),
        Icon(Iconsax.verify5, color: iconColor, size: MegamartSize.iconXs,)
      ],

    );
  }

}