import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/serachbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/layout/gridveiw.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/product_cart/product_cart_verticale.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/home/widget/home_appbar.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/home/widget/homecetagroies.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/home/widget/promo_slider.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HEADER SECTION
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// App Bar
                  const HomeAppBar(),

                  const SizedBox(
                    height: MegamartSize.spaceBetweenItems,
                  ),

                  /// Search Bar
                  const AppBarSerachBarContainer(
                    text: 'Search Product',
                    icon: Iconsax.search_normal,
                  ),

                  const SizedBox(
                    height: MegamartSize.spaceBetweenSections,
                  ),

                  /// Section Heading
                  const Padding(
                    padding: EdgeInsets.only(
                      left: MegamartSize.defaultSpace,
                    ),
                    child: SectionHeading(
                      title: 'Popular Categories',
                    ),
                  ),

                  SizedBox(height: MegamartSize.spaceBetweenItems,),

                  /// Categories
                  const HomeCetagories(),
                ],
              ),
            ),

            /// BODY SECTION
            Padding(
              padding: const EdgeInsets.all(
                MegamartSize.defaultSpace,
              ),
              child: Column(
                children: [

                  /// Promo Slider
                  const EpromoSlider(
                    banners: [
                      MegamartImages.promo,
                      MegamartImages.promo2,
                      MegamartImages.promo3,
                    ],
                  ),
                  //heading
                  const SectionHeading(title: 'Papular Products',), 
                  const SizedBox(
                    height: MegamartSize.spaceBetweenItems,
                  ),

                  /// Popular Products
                  EGridView(itemCount: 4, mainAxisExtent: 305, itemBuilder: (_, index)=> const ProductCartVertical(),),
                ],
              ),
            ),
            const SizedBox(height: MegamartSize.spaceBetweenItems,)
          ],
        ),
      ),
    );
  }
}
