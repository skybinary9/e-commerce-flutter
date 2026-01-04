import 'package:ecommerce_final_year_project/common/styles/megamart_spacing_style.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MegamartPaddingStyle.paddingwithAppbarHeight * 2,
          child: Column(
            children: [
              /// IMAGE
             Image(image: AssetImage(image), width: HelperFunction.screenWidth(context)*0.6,),
              const SizedBox(height: MegamartSize.spaceBetweenSections),
              /// TITLE
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              /// TITLE

              /// SUBTITLE
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              /// TITLE

              /// BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
