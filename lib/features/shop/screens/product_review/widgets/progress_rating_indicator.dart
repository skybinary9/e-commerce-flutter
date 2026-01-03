import 'package:ecommerce_final_year_project/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class OverAllRatingProduct extends StatelessWidget {
  const OverAllRatingProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text('4.8', style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              EAppIndicaotr(text: '5', value: 1.0,),
              EAppIndicaotr(text: '4', value: 0.8,),
              EAppIndicaotr(text: '3', value: 0.6,),
              EAppIndicaotr(text: '2', value: 0.4,),
              EAppIndicaotr(text: '1', value: 0.2,),
            ],
          ),
        )
      ],
    );
  }
}
