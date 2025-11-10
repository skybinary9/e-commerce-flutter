import 'package:ecommerce_final_year_project/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Positioned(
      right: MegamartSize.defaultSpace,
      bottom: MegamartDeviceUtility.getBottomNavigationBarHeigjht(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark
              ? MegamartColors.dark
              : MegamartColors.primary,
          padding: const EdgeInsets.all(16),
          elevation: 4,
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
          color: Colors.white,
        ),
      ),
    );
  }
}
