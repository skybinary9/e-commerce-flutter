import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){},
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems,),
        Row(
          children: [
            AppCircularContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? MegamartColors.light :MegamartColors.white,
              padding: const EdgeInsets.all(MegamartSize.sm),
              child: const Image(image: AssetImage(MegamartImages.paypal)),
            ),
            const SizedBox(width : MegamartSize.spaceBetweenItems),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}