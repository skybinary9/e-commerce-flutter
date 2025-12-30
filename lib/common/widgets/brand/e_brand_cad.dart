import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/e_text_verify_icon.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/enum.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    super.key, required this.showBorder, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
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
  }
}
