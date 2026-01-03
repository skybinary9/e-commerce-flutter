import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return AppCircularContainer(
                width: double.infinity,
                padding: const EdgeInsets.all(MegamartSize.md),
                showBorder: true,
                backgroundColor: selectedAddress ? MegamartColors.primary.withOpacity(0.5) : Colors.transparent,
                borderColor: selectedAddress ? Colors.transparent : 
                dark ? MegamartColors.darkGray : MegamartColors.grey,
                margin: EdgeInsets.only(bottom : MegamartSize.spaceBetweenItems),
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Icon(selectedAddress ? Iconsax.tick_circle5 : null, 
                    color: selectedAddress? dark ?MegamartColors.light : MegamartColors.dark : null, ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shoaib', maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: MegamartSize.sm/2,),
                      Text('+9234665656', maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                      const SizedBox(height: MegamartSize.sm/2,),
                      Text('41 house dhad bagh', maxLines: 2,
                      softWrap: true,
                      ),

                    ],
                  )
                  ],
            ),
              );
  }
}