import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';

class ETabBar extends StatelessWidget implements PreferredSizeWidget {
  const ETabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
     isScrollable: true,
     indicatorColor: MegamartColors.primary,
     unselectedLabelColor: MegamartColors.grey,
     labelColor: HelperFunction.isDarkMode(context) ? MegamartColors.white : MegamartColors.primary,
     tabs : tabs,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MegamartDeviceUtility.getappBarHeight());
}
