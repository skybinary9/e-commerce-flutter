import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/product_review/product_review.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/product_attirbutes.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/bottom_add_to_cart.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/image_product_slide.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/product_meta.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/rating_share.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_more_text/read_more_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    
    return Scaffold(
      body: SafeArea( // Wrap with SafeArea
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EProductImageSlider(),
                    Padding(
                      padding: const EdgeInsets.all(MegamartSize.defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Rating(),
                          const SizedBox(height: MegamartSize.md),
                          const ProductMetaData(),
                          const SizedBox(height: MegamartSize.md),
                          const ProductAttirbutes(),
                          const SizedBox(height: MegamartSize.lg),
                          
                          /// Checkout Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){}, 
                              child: const Text("Checkout")
                            ),
                          ),
                          
                          const SizedBox(height: MegamartSize.lg),
                          const Divider(),
                          const SizedBox(height: MegamartSize.md),
                          
                          /// Description
                          const SectionHeading(
                            title: 'Description', 
                            showactionButton: false,
                          ),
                          const SizedBox(height: MegamartSize.sm),
                          ReadMoreText(
                            'This product offers reliable performance, ease of use, and a clean, modern design for everyday needs.',
                            numLines: 2,
                            readMoreText: 'Show more', 
                            readLessText: 'Less',
                            style: TextStyle(
                              color: dark ? MegamartColors.white : MegamartColors.dark,
                            ),
                            readMoreTextStyle: TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.w600,
                              color: MegamartColors.primary,
                            ),
                          ),
                          
                          const SizedBox(height: MegamartSize.lg),
                          const Divider(),
                          const SizedBox(height: MegamartSize.md),
                          
                          /// Review
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SectionHeading(
                                title: 'Review(199)', 
                                showactionButton: false,
                              ),
                              IconButton(
                                onPressed: () => Get.to(() => const ProductReview()), 
                                icon: Icon(
                                  Icons.arrow_circle_right,
                                  color: MegamartColors.primary,
                                )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BottomAddToCart(), // Bottom navigation outside scroll
          ],
        ),
      ),
    );
  }
}