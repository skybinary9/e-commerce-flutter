import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/brand/e_brand_cad.dart';
import 'package:ecommerce_final_year_project/common/widgets/layout/gridveiw.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/all_brands/brandsproducts.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(
        title: Text('Brands'),
        showbackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(
                title: 'Brands',
                showactionButton: false,
              ),
              SizedBox(height: MegamartSize.defaultSpace),

              /// Grid List
              EGridView(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => EBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => Brandsproducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
