import 'package:ecommerce_final_year_project/common/widgets/brand/e_brand_show_case.dart';
import 'package:ecommerce_final_year_project/common/widgets/layout/gridveiw.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/product_cart/product_cart_verticale.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TabViewCetagroies extends StatelessWidget {
  const TabViewCetagroies({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(MegamartSize.defaultSpace),
      children: [
        const EBandShowCase(
          images: [
            MegamartImages.latop,
            MegamartImages.mouse,
            MegamartImages.keyboard,
          ],
        ),

        const SizedBox(height: MegamartSize.defaultSpace),

        SectionHeading(
          title: 'You might like',
          showactionButton: true,
          onPressed: () {},
        ),

        const SizedBox(height: MegamartSize.defaultSpace),

        EGridView(
          itemCount: 4,
          mainAxisExtent: 360,
          itemBuilder: (_, index) => const ProductCartVertical(),
        ),
      ],
    );
  }
}
