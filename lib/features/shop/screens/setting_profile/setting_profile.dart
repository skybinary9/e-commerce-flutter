import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/listtile/t_setting_menu_title.dart';
import 'package:ecommerce_final_year_project/common/widgets/listtile/user_pofile_tile.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///--- Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // header widgets here
                  EAppbar(title: Text("Account", style: Theme.of(context).textTheme.headlineMedium!.apply(color: MegamartColors.white),),),
                  const SizedBox(height: MegamartSize.spaceBetweenSections,),
                  ///---user profile
                  UserProfileTile(),
                ],
              ),
            ),
            ///--- Body
            const Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
            child: Column(
              children: [
                ///App setting
                SectionHeading(title: 'Account Setting', showactionButton: false,),
                SizedBox(height: MegamartSize.spaceBetweenItems,),
                TSettingMenuTitle(title: 'My Account', subtitle: 'Set shopping delivery address', icon: Iconsax.safe_home,),
                TSettingMenuTitle(title: 'My Cart', subtitle: 'Add, remove products, and move to checkout', icon: Iconsax.shopping_cart,),
                TSettingMenuTitle(title: 'My Order', subtitle: 'In progress and complete oders', icon: Iconsax.bag_tick,),
                TSettingMenuTitle(title: 'Bank Account', subtitle: 'Withdraw blance to registerd bank acoun', icon: Iconsax.bank,),
                TSettingMenuTitle(title: 'My Coupons', subtitle: 'List of all of the disconnected coupons', icon: Iconsax.discount_shape,),
                TSettingMenuTitle(title: 'Notification', subtitle: 'Set any kind of notification message', icon: Iconsax.notification,),
                TSettingMenuTitle(title: 'Account Privacy', subtitle: 'Manage data usage and connected account', icon: Iconsax.security_card,),
                
                /// App Setting
                SizedBox(height: MegamartSize.spaceBetweenItems,),
                SectionHeading(title: 'App Setting', showactionButton: false,),
                SizedBox(height: MegamartSize.spaceBetweenItems,),
                TSettingMenuTitle(title: 'Upload Data', subtitle: 'Upload Data', icon: Iconsax.document_upload,),

              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
