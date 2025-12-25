import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart' show MegamartSize;
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppBarSerachBarContainer extends StatelessWidget {
  const AppBarSerachBarContainer({
    super.key, required this.text, this.icon,  this.showBackGround = true,  this.showBorder = true, this.onTap,
  });
  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MegamartSize.defaultSpace),
        child: Container(
          width: MegamartDeviceUtility.getScreenwidth(context),
          padding: const EdgeInsets.all(MegamartSize.md),
          decoration: BoxDecoration(
            color: showBackGround ? dark ? MegamartColors.dark : MegamartColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(MegamartSize.cardRadiusLg),
            border: showBorder ? Border.all(color: Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: MegamartColors.darkGray,),
              const SizedBox(width: MegamartSize.spaceBetweenItems,),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: dark ? MegamartColors.light : MegamartColors.darkGray  ),),
            ],
          ),
        ),
      ),
    );
  }
}
