import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/product_cart/product_cart_horizontal.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class SubCetagoires extends StatelessWidget {
  const SubCetagoires({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppbar(
        title: Text("Sport Shirt"),
        showbackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const ERoundImage(
                width: double.infinity,
                imgeUrl: MegamartImages.promo2,
                applyImageRadius: true,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenSections),
              
              /// Sub-categories Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Heading
                  SectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: MegamartSize.spaceBetweenItems / 2),
                  
                  /// Horizontal Products List - FIXED
                  SizedBox(
                    height: 200, // Fixed height
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      separatorBuilder: (context, index) => 
                          const SizedBox(width: MegamartSize.spaceBetweenItems),
                      itemBuilder: (context, index) => SizedBox(
                        width: 320, // ProductCardHorizontal width + padding
                        child: const ProductCardHorizontal(),
                      ),
                    ),
                  ),
                ],
              ),
              
              /// Additional Content (اگر مزید ویجٹس ہوں)
              const SizedBox(height: MegamartSize.spaceBetweenSections),
              
              /// Recommended Products Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeading(
                    title: 'Recommended',
                    onPressed: () {},
                  ),
                  const SizedBox(height: MegamartSize.spaceBetweenItems / 2),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: MegamartSize.spaceBetweenItems,
                      crossAxisSpacing: MegamartSize.spaceBetweenItems,
                      mainAxisExtent: 250, // Fixed height for grid items
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MegamartSize.md),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(MegamartSize.md),
                                    topRight: Radius.circular(MegamartSize.md),
                                  ),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(Icons.image, size: 60, color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(MegamartSize.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product ${index + 1}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: MegamartSize.xS),
                                  Text(
                                    '\$${(index + 1) * 25}.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}