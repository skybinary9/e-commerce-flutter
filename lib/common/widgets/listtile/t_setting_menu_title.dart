import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TSettingMenuTitle extends StatelessWidget {
  const TSettingMenuTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.icon,
    this.onTap,
    this.textColor,
    this.iconColor,
  });

  final String title, subtitle;
  final Widget? trailing;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: iconColor ?? (dark ? MegamartColors.light : MegamartColors.primary),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.apply(
              color: textColor ?? (dark ? MegamartColors.white : MegamartColors.black),
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.apply(
              color: dark ? MegamartColors.grey : MegamartColors.darkGray,
            ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}