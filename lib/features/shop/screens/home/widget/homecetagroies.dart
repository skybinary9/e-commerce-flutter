import 'package:ecommerce_final_year_project/features/shop/controllers/cetagories_controller.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/sub_cetagroies/sub_cetagoires.dart';
import 'package:ecommerce_final_year_project/utils/popups/cetgory_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesController categoriesController = Get.put(
      CategoriesController(),
    );

    return Obx(() {
      if (categoriesController.isLoading.value) {
        return const CategoryShimmer();
      }

      if (categoriesController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Categories Found!",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 140, // increased height for better spacing
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemCount: categoriesController.featuredCategories.length,
          itemBuilder: (_, index) {
            final category = categoriesController.featuredCategories[index];

            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Get.to(
                () => SubCetagoires(
                  categoryId: category.id ?? '',
                  categoryName: category.name,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// IMAGE
                  Container(
                    height: 70, // slightly bigger
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(category.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10), // increased spacing
                  /// TEXT
                  SizedBox(
                    width: 80, // slightly wider
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      maxLines: 2, // allow two lines for long names
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // better contrast on orange
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
