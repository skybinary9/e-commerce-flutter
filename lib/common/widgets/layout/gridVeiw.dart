// ignore_for_file: file_names
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class EGridView extends StatelessWidget {
  const EGridView({
    super.key, 
    required this.itemCount, 
    required this.itemBuilder,
    this.mainAxisExtent = 300, 
  });
  final int itemCount;
  final double ? mainAxisExtent;
  final Widget ? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing:
            MegamartSize.gridViewSpacing,
        crossAxisSpacing:
            MegamartSize.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
