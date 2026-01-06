import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/product_cart/product_cart_horizontal.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/features/shop/controllers/cetagories_controller.dart';
import 'package:ecommerce_final_year_project/features/shop/models/category_model.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCetagoires extends StatelessWidget {
  SubCetagoires({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;
  final CategoriesController categoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(
        title: Text(categoryName),
        showbackArrow: true,
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: categoriesController.getSubCategories(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error loading categories",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No sub-categories found",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          final subCategories = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(MegamartSize.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Banner - You can use category image if available
                  ERoundImage(
                    width: double.infinity,
                    imgeUrl: subCategories.isNotEmpty 
                        ? subCategories.first.image 
                        : MegamartImages.promo2,
                    applyImageRadius: true,
                  ),
                  
                  const SizedBox(height: MegamartSize.spaceBetweenSections),

                  /// Sub-categories Section Heading
                  SectionHeading(
                    title: "$categoryName Sub-Categories",
                    onPressed: () {},
                  ),
                  
                  const SizedBox(height: MegamartSize.spaceBetweenItems / 2),

                  /// Sub-categories Grid View
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: MegamartSize.gridViewSpacing,
                      mainAxisSpacing: MegamartSize.gridViewSpacing,
                      mainAxisExtent: 100,
                    ),
                    itemCount: subCategories.length,
                    itemBuilder: (context, index) {
                      final subCategory = subCategories[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to products screen or further sub-categories
                          Get.to(
                            () => SubCetagoires(
                              categoryId: subCategory.id ?? '',
                              categoryName: subCategory.name,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (subCategory.image.isNotEmpty)
                                Image.network(
                                  subCategory.image,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              const SizedBox(height: 8),
                              Text(
                                subCategory.name,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenSections),

                  /// Products in this category Section
                  SectionHeading(
                    title: "Products in $categoryName",
                    onPressed: () {},
                    showactionButton: true,
                  ),
                  
                  const SizedBox(height: MegamartSize.spaceBetweenItems / 2),

                  /// Horizontal Products List
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4, // Replace with actual product count
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: MegamartSize.spaceBetweenItems),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 320,
                          child: ProductCardHorizontal(
                            categoryName: categoryName,
                            categoryId: categoryId,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}