
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class CuponCode extends StatelessWidget {
  const CuponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return AppCircularContainer(
      showBorder: true,
      backgroundColor: dark ? MegamartColors.dark : MegamartColors.white,
      padding: const EdgeInsets.only(top: MegamartSize.sm, bottom: MegamartSize.sm, right: MegamartSize.sm, left: MegamartSize.md ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code ?',
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          /// Button
          SizedBox(width: 80, child: ElevatedButton(onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            foregroundColor: dark? MegamartColors.white.withOpacity(0.5) : MegamartColors.dark.withOpacity(0.5),
            backgroundColor: Colors.grey.withOpacity(0.2),
            side: BorderSide(color: Colors.grey.withOpacity(0.1))
          ),
          child: Text('Apply')))
        ],
      ),
    
    );
  }
}