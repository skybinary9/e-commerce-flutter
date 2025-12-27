import 'package:ecommerce_final_year_project/common/styles/megamart_spacing_style.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
    this.image,
  });

  final Future<void> Function() onPressed;
  final String title;
  final String subtitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MegamartPaddingStyle.paddingwithAppbarHeight * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Optional Image
              if (image != null)
                Image.asset(
                  image!,
                  height: 180,
                ),

              const SizedBox(height: MegamartSize.spaceBetweenItems),

              /// Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: MegamartSize.spaceBetweenItems),

              /// Subtitle
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: MegamartSize.spaceBetweenSections),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()  => onPressed(),
                  child: Text(MegamartText.toContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
