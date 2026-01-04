import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/brand/e_brand_cad.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/sort/sort.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class Brandsproducts extends StatelessWidget {
  const Brandsproducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
        child: Column(
          children: [
            EBrandCard(showBorder: true,),
            const SizedBox(height: MegamartSize.defaultSpace,),
            DropDownItems()
          ],
        ),
        ),
      ),
    );
  }
}