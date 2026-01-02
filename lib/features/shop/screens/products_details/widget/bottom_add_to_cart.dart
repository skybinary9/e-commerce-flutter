import 'package:ecommerce_final_year_project/common/widgets/icon/e_icon.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: MegamartSize.defaultSpace,
        vertical: MegamartSize.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: dark ? MegamartColors.darkerGray : MegamartColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MegamartSize.cardRadiusLg),
          topRight: Radius.circular(MegamartSize.cardRadiusLg),
        ),
      ),
      child: Row(
        children: [
          /// ➖ Quantity Buttons
          Row(
            children: [
              EcircularIcon(
                icon: Iconsax.minus,
                backgroundColor: MegamartColors.darkGray,
                width: 40,
                height: 40,
                color: MegamartColors.white,
              ),
              const SizedBox(width: MegamartSize.spaceBetweenItems),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: MegamartSize.spaceBetweenItems),
              EcircularIcon(
                icon: Iconsax.add,
                backgroundColor: MegamartColors.black,
                width: 40,
                height: 40,
                color: MegamartColors.white,
              ),
            ],
          ),

          /// 🔥 Space push for button
          const Spacer(),

          /// 🛒 Add To Cart Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: MegamartSize.lg,
                vertical: MegamartSize.md,
              ),
              backgroundColor: MegamartColors.black,
              side: const BorderSide(color: MegamartColors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MegamartSize.cardRadiusMd),
              ),
            ),
            child: const Text('Add To Cart'),
          ),
        ],
      ),
    );
  }
}
