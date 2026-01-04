import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/listtile/t_setting_menu_title.dart';
import 'package:ecommerce_final_year_project/common/widgets/listtile/user_pofile_tile.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/address/address.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/pofile_screen.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/oder/oder.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HEADER
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  EAppbar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: MegamartColors.white),
                    ),
                  ),

                  const SizedBox(height: 12),

                  UserProfileTile(
                    onEditTap: () => Get.to(() => const PofileScreen()),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            /// BODY (❌ const removed)
            Padding(
              padding: const EdgeInsets.all(MegamartSize.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: 'Account Setting',
                    showactionButton: false,
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  TSettingMenuTitle(
                    icon: Iconsax.safe_home,
                    title: 'My Account',
                    subtitle: 'Set shopping delivery address',
                    onTap: ()=> Get.to(()=> const UserAddressScreen() ),
                    
                  ),

                  const TSettingMenuTitle(
                    title: 'My Cart',
                    subtitle: 'Add, remove products, and move to checkout',
                    icon: Iconsax.shopping_cart,
                  ),

                  TSettingMenuTitle(
                    title: 'My Order',
                    subtitle: 'In progress and complete orders',
                    icon: Iconsax.bag_tick,
                    onTap: ()=> Get.to(()=> const OderScreen())
                  ),

                  const TSettingMenuTitle(
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    icon: Iconsax.bank,
                  ),

                  const TSettingMenuTitle(
                    title: 'My Coupons',
                    subtitle: 'List of all disconnected coupons',
                    icon: Iconsax.discount_shape,
                  ),

                  const TSettingMenuTitle(
                    title: 'Notification',
                    subtitle: 'Set notification messages',
                    icon: Iconsax.notification,
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),
                  const Divider(),
                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  /// LOGOUT BUTTON ✅
                  TSettingMenuTitle(
                    title: 'Logout',
                    subtitle: 'Sign out from your account',
                    icon: Iconsax.logout,
                    textColor: Colors.red,
                    onTap: () => _showLogoutDialog(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ LOGOUT DIALOG
  void _showLogoutDialog() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textCancel: 'Cancel',
      textConfirm: 'Logout',
      confirmTextColor: Colors.white,
      cancelTextColor: MegamartColors.darkGray,
      buttonColor: Colors.red,
      onConfirm: () async {
        Get.back();
        await AuthenticationRepository.instance.logout();
      },
    );
  }
}
