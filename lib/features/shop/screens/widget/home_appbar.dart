import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/product_cart/menu_product_cart.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EAppbar(showbackArrow: false, title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MegamartText.homeTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MegamartColors.white),),
        Text(MegamartText.homeSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MegamartColors.white),)
        ],
      ),
      actions: [
        CartCounterIcon(iconColor: MegamartColors.white, onPressed: () {},)
         ],
    );
  }
}
