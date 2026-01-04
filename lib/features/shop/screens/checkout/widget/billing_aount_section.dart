import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$245', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fees', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$245', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fees', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$245', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Oder Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$245', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
      ],
    );
  }
}