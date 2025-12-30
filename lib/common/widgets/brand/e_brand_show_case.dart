
import 'package:ecommerce_final_year_project/common/widgets/brand/e_brand_cad.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EBandShowCase extends StatelessWidget {
  const EBandShowCase({
    super.key, required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AppCircularContainer(
      showBorder: true,
      borderColor: MegamartColors.darkGray,
      padding: const EdgeInsets.all(MegamartSize.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(
        bottom: MegamartSize.spaceBetweenItems,
      ),
      child: Column(
        children: [
          EBrandCard(showBorder: false),
          const SizedBox(height: MegamartSize.spaceBetweenItems,),
          // brand top 3 poduct
          Row(
            children: images.map((image) => brandTopProductImagesWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }
  Widget brandTopProductImagesWidget(String image, context){
    return Expanded(child: AppCircularContainer(
      height: 100,
      padding: const EdgeInsets.all(MegamartSize.md),
      margin: const EdgeInsets.only(right: MegamartSize.sm),
      backgroundColor: HelperFunction.isDarkMode(context)? 
      MegamartColors.darkerGray : MegamartColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),



    ));

  }
}

