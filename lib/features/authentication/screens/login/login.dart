import 'package:ecommerce_final_year_project/common/styles/megamart_spacing_style.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MegamartPaddingStyle.paddingwithAppbarHeight,
          child: Column(
            children: [
              // ---------------- Header Section ----------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      dark
                          ? MegamartImages.lightlogo
                          : MegamartImages.darklogo,
                    ),
                    height: 150,
                  ),
                  const SizedBox(height: MegamartSize.spaceBtwSection),
                  Text(
                    MegamartText.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: MegamartSize.sm),
                  Text(
                    MegamartText.loginSubTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              // ---------------- Login Form Section ----------------
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: MegamartSize.spaceBtwSection),
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.direct_right),
                          labelText: MegamartText.email,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MegamartSize.inputfieldradius),
                          ),
                        ),
                      ),
                      const SizedBox(height: MegamartSize.spaceBtwInputFields),

                      // Password Field
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Iconsax.eye_slash),
                          labelText: MegamartText.password,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MegamartSize.inputfieldradius),
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: MegamartSize.spaceBtwInputFields / 2),

                      // Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                              Text(MegamartText.rememberMe),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(MegamartText.forgotPassword),
                          ),
                        ],
                      ),

                      const SizedBox(height: MegamartSize.spaceBtwSection),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MegamartSize.buttonradius),
                            ),
                          ),
                          child: const Text(
                            MegamartText.signIn,
                            style: TextStyle(
                              fontSize: MegamartSize.fontsizelg,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: MegamartSize.spaceBtwSection),

                      // Sign Up Button
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            text: MegamartText.noAccount,
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: MegamartText.signUp,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: MegamartSize.spaceBtwSection),

                      // ---------------- Divider ----------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Divider(
                              color: dark
                                  ? MegamartColors.darkGray
                                  : MegamartColors.dGray,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 5,
                            ),
                          ),
                          Text(
                            MegamartText.signWith,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Flexible(
                            child: Divider(
                              color: dark
                                  ? MegamartColors.darkGray
                                  : MegamartColors.dGray,
                              thickness: 0.5,
                              indent: 5,
                              endIndent: 60,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: MegamartSize.spaceBtwItems),

                      // ---------------- Footer (Social Icons) ----------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Google
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: MegamartColors.dGray,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                height: MegamartSize.iconmd,
                                width: MegamartSize.iconmd,
                                image: AssetImage(MegamartImages.google),
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: MegamartSize.spaceBtwItems),

                          // Facebook
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: MegamartColors.dGray,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                height: MegamartSize.iconmd,
                                width: MegamartSize.iconmd,
                                image: AssetImage(MegamartImages.facebook),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
