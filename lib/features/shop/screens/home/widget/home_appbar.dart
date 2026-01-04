import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/cart/menu_product_cart.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/popups/shimar_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserControlller());
    return EAppbar(showbackArrow: false, title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MegamartText.homeTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MegamartColors.white),),
        Obx((){
          if (controller.profileLoading.value) {
            return const ShimarLoader(width: 80, height: 15);
            }
            else {
              return Text(controller.user.value.fullName, 
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: MegamartColors.white),);
            }
        }
        )
        ],
      ),
      actions: [
        CartCounterIcon(iconColor: MegamartColors.white, onPressed: () {},)
         ],
    );
  }
}
