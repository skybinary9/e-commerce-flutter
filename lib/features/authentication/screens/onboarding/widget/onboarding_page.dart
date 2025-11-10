import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key, required this.images, required this.title, required this.subtitle,
  });
  
  final String images, title, subtitle ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MegamartSize.defaultSpace),
      child: Column(
        children: [
          Image
          ( 
            width: HelperFunction.screenWidth(context) * 0.8,
            height:HelperFunction.screenHeight(context) * 0.6,
            image: AssetImage(images),
            filterQuality: FilterQuality.low,
            ),
            //title
            Text(title, 
            style: Theme.of(context).textTheme.headlineMedium, 
            textAlign: TextAlign.center,),
            const SizedBox(height: MegamartSize.spaceBetweenItems,),
      
            Text(subtitle, 
            style: Theme.of(context).textTheme.bodyMedium, 
            textAlign: TextAlign.center,),
        ]       
      ),
    );
  }
}