import 'package:ecommerce_final_year_project/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    final controller = OnboardingController.instance;

    return Positioned(
      bottom: MegamartDeviceUtility.getBottomNavigationBarHeigjht() + 25,
      left: MegamartSize.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          dotColor: dark ? Colors.white54 : Colors.black26,
          activeDotColor: dark ? Colors.white : Colors.black,
          dotHeight: 6,
          dotWidth: 10,
          expansionFactor: 3,
        ),
      ),
    );
  }
}
