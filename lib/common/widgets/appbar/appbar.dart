import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EAppbar extends StatelessWidget implements PreferredSizeWidget {
    const EAppbar({super.key, 
    this.leadingIcon, 
    this.title, 
    this.showbackArrow = false, 
    this.actions, 
    this.leadingOnPressed
    });

    final IconData? leadingIcon;
    final Widget? title;  
    final bool showbackArrow;
    final List<Widget>? actions;
    final VoidCallback? leadingOnPressed;

    @override
    Widget build(BuildContext context) {
        return Padding( padding: const EdgeInsets.symmetric(horizontal: MegamartSize.md),
        child: AppBar( 
           automaticallyImplyLeading: false,
           leading: showbackArrow ? IconButton(onPressed: ()=> Get.back(), icon: Icon(Iconsax.arrow_left, color: HelperFunction.isDarkMode(context) ? MegamartColors.white : MegamartColors.black,)) 
           : (leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null),
              title: title,
              centerTitle: false,
              actions: actions,
        ),
        );
    }

    @override
    Size get preferredSize => Size.fromHeight(MegamartDeviceUtility.getappBarHeight());
}

   