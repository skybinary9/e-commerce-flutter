import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/features/shop/controllers/home_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EpromoSlider extends StatelessWidget {
  const EpromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(viewportFraction: 1,
          onPageChanged:(index, _) =>controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => ERoundImage(imgeUrl: url)).toList(),
    
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems,),
        Center(
          child: Obx(
            ()=>
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i =0; i< banners.length; i++) 
                AppCircularContainer(height: 4, width: 20,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value ==i ? 
                  MegamartColors.primary : MegamartColors.grey,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
