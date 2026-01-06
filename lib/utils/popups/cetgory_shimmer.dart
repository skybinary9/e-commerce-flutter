import 'package:flutter/material.dart';
import 'shimar_loader.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (_, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              /// Circle Image Shimmer
              ShimarLoader(width: 60, height: 60, radius: 30),

              SizedBox(height: 8),

              /// Text Shimmer
              ShimarLoader(width: 50, height: 12, radius: 6),
            ],
          );
        },
      ),
    );
  }
}
