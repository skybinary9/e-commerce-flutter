import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/serachbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/layout/gridveiw.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/cart/menu_product_cart.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/e_text_verify_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/enum.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EStoreScreen extends StatelessWidget {
  const EStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(title: Text("Store"),
      actions: [
        CartCounterIcon(iconColor: MegamartColors.white, onPressed: () {},)
      ], 
      ),
      body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled){
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: HelperFunction.isDarkMode(context)? MegamartColors.black : MegamartColors.white,
            expandedHeight: 440,
            flexibleSpace: Padding(
              padding: EdgeInsets.all(MegamartSize.defaultSpace),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(
                    height: MegamartSize.spaceBetweenItems,),
                    ////---Search
                    const AppBarSerachBarContainer(icon: Iconsax.search_normal, 
                    text: 'Search In Store', 
                    showBorder: true, 
                    showBackGround: false,
                    padding: EdgeInsetsGeometry.zero,
                    ),
                    const SizedBox(
                    height: MegamartSize.spaceBetweenSections,),
                    ///---Feature
                    SectionHeading(title: 'Featured & Brands', onPressed: (){}),
                    const SizedBox(
                    height: MegamartSize.spaceBetweenItems /1.5 ,),
                    EGridView(itemCount: 4, mainAxisExtent: 80,itemBuilder: (_, index){
                      return GestureDetector(
                      onTap: (){},
                      child: AppCircularContainer(
                        height: 80,
                        radius: 16,
                        padding: const EdgeInsets.all(MegamartSize.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          //icon
                          children: [
                          Flexible(
                            child: ECircularImage(
                              isNetworkImag: false,
                              backgroundColor: Colors.transparent,
                              image: MegamartImages.clothicon,
                              overlayColor: HelperFunction.isDarkMode(context) ? MegamartColors.white : MegamartColors.black,
                              ),
                          ),
                            const SizedBox(width: MegamartSize.spaceBetweenItems /2),
                            //Text
                            Column(
                              children: [
                                Expanded(child: ETexBranWithVerifyIcon(tilte: 'Nike', brandTextSizes: TextSize.large,)),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("256 Products", 
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelLarge,),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                    },)
                    
                ],
              ),
              ),
          )
        ];
        
      }, body: Container(

      )),
    );
  }
}
