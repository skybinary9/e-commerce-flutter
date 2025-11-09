import 'package:ecommerce_final_year_project/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MegamartDeviceUtility.getappBarHeight(),
      right: MegamartSize.defaultspace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
