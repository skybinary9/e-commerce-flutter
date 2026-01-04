import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping address', buttonTitle: 'chage', onPressed: (){},),
        Text('Codeing', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(width: MegamartSize.spaceBetweenItems/2,),
        Row(children: [
          const Icon(Icons.phone, color: Colors.grey, size: 16,),
          const SizedBox(width: MegamartSize.spaceBetweenItems,),
          Expanded(child: Text('+92-324566778', style: Theme.of(context).textTheme.bodyMedium,))
        ],
        ),
        const SizedBox(width: MegamartSize.spaceBetweenItems,),
        Row(children: [
          const Icon(Icons.location_history, color: Colors.grey, size: 16,),
          const SizedBox(width: MegamartSize.spaceBetweenItems,),
          Expanded(child: Text('Shoad bagh lahore', style: Theme.of(context).textTheme.bodyMedium,))
        ],
        ),
        const SizedBox(width: MegamartSize.spaceBetweenItems,),
      ],
    );
  }
}