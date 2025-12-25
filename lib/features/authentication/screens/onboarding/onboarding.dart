import 'package:ecommerce_final_year_project/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/widget/onboadring_navigation.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/widget/onboardingnextbutton.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Page View
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,

            children: [
              OnboardingPage(
                images: MegamartImages.onboard1, 
                title: MegamartText.onBoardingTitle1, 
                subtitle: MegamartText.onBoardingSubTitle1,
                ),
              OnboardingPage(
                images: MegamartImages.onboard2, 
                title: MegamartText.onBoardingTitle2, 
                subtitle: MegamartText.onBoardingSubTitle2,
                ),
              OnboardingPage(
                images: MegamartImages.onboard2, 
                title: MegamartText.onBoardingTitle3, 
                subtitle: MegamartText.onBoardingSubTitle3,
                ),
          // skip buttton
         
          
          ],
          ),
           OnboardingSkip(),
          
          //smoth page indicator

          OnboardingDotNavigation(),

          // circular button
          OnboardingNextButton(),
        ],
      ),
    );
  }
}