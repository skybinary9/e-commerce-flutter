import 'package:ecommerce_final_year_project/common/text/headertext.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/serachbar.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/widget/home_appbar.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/widget/homecetagroies.dart';
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
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Home AppBar
                  const HomeAppBar(),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  /// Search Bar
                  const AppBarSerachBarContainer(
                    text: 'Search Product',
                    icon: Iconsax.search_normal,
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenSections),

                  /// Section Heading
                  const Padding(
                    padding: EdgeInsets.only(
                      left: MegamartSize.defaultSpace,
                    ),
                    child:  SectionHeading(
                      title: 'Popular Categories',
                    ),
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  /// Categories List
                  HomeCetagories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
