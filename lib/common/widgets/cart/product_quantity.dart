
import 'package:ecommerce_final_year_project/common/widgets/icon/e_icon.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        EcircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: MegamartSize.md,
          color: HelperFunction.isDarkMode(context)
              ? MegamartColors.white
              : MegamartColors.black,
          backgroundColor: HelperFunction.isDarkMode(context)
              ? MegamartColors.darkerGray
              : MegamartColors.light,
        ),
    
        const SizedBox(width: MegamartSize.spaceBetweenItems),
    
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
    
        const SizedBox(width: MegamartSize.spaceBetweenItems),
    
        EcircularIcon(
          icon: Iconsax.add,
          height: 35,
          width: 35,
          size: MegamartSize.md,
          color: MegamartColors.white,
          backgroundColor: MegamartColors.primary,
        ),
      ],
    );
  }
}
