import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSettingMenuTitle extends StatelessWidget {
  const TSettingMenuTitle({super.key, 
  required this.title, 
  required this.subtitle, 
  this.trailing, 
  required this.icon, 
  this.onTap
  });

  final String title, subtitle;
  final Widget? trailing;
  final IconData icon;
  final VoidCallback ? onTap; 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: MegamartColors.primary,),
      title:  Text(title, style: 
        Theme.of(context).textTheme.titleMedium!.apply(color: MegamartColors.white)),
        subtitle:  Text(subtitle, style: 
        Theme.of(context).textTheme.labelMedium!.apply(color: MegamartColors.white)),
        trailing: trailing,
        onTap: onTap,

    );
  }
}