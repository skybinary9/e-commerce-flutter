

import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.OnPressed, 
    required this.title, 
    required this.vlaue, 
    this.icon =Iconsax.arrow_right,
  });
  final VoidCallback OnPressed;
  final String title , vlaue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MegamartSize.spaceBetweenItems/1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title, style: Theme.of(context).textTheme.bodySmall, 
              overflow: TextOverflow.ellipsis,),
            ),
            Expanded(
              flex: 5,
              child: Text(title, style: Theme.of(context).textTheme.bodyMedium, 
              overflow: TextOverflow.ellipsis,),
            ),
            Expanded(child: Icon(icon, size: 18,))
          ],
        ),
      ),
    );
  }
}