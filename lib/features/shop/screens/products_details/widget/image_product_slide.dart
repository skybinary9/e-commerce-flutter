import 'dart:ui';

import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/icon/e_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/home/widget/curved_adge_widget.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return CurvedEdgeWidget(child: Container(
      color: dark ? MegamartColors.darkGray : MegamartColors.light,
      child:  Stack(
        children: [
          const SizedBox(height: 400, child: Padding(
            padding: EdgeInsets.all(MegamartSize.productImageRadius *2),
            child: Center(child: Image(image: AssetImage(MegamartImages.keyboard))),
          ),
          ),
          /// images slider
          Positioned(
            right: 0,
            bottom: 30,
            left: MegamartSize.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, _)
                 => const SizedBox(width: MegamartSize.spaceBetweenItems,),
                itemCount: 30, itemBuilder: (_, index)=> ERoundImage(
                width: 80,
                backgrounColor: dark ? MegamartColors.dark : MegamartColors.white,
                border: Border.all(color: MegamartColors.primary),
                padding: const EdgeInsets.all(MegamartSize.sm),
                imgeUrl: MegamartImages.latop,), ),
            ),
          ),
          const EAppbar(
            showbackArrow: true,
            actions: [
              EcircularIcon(icon: Iconsax.heart, color: Colors.red,)
            ],
          )
        ],
      ),
    ),
    );
  }
}