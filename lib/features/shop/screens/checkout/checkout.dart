import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/cart/coupon_code.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/login_signup/success_screen/success_screen.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/checkout/widget/billing_aount_section.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:ecommerce_final_year_project/navigationbottom.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: EAppbar(
        title: Text(
          "Oder Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            children: [
              ECartItem(showAddRemoveButton: false,),
              const SizedBox(height: MegamartSize.spaceBetweenSections,),

              ///---cupon code
              CuponCode(),
              const SizedBox(height: MegamartSize.spaceBetweenItems,),

              ///---billing section
              AppCircularContainer(showBorder: true,
              padding: const EdgeInsets.all(MegamartSize.md),
              backgroundColor: dark ? MegamartColors.dark : MegamartColors.white,
              child: Column(
                children: [
                  ///Price
                  BillingAmountSection(),
                  const SizedBox(height: MegamartSize.spaceBetweenItems,),
                  ///Divider
                  Divider(),
                  const SizedBox(height: MegamartSize.spaceBetweenItems,),
                  ///Payment Methods
                  BillingPaymentSection(),
                  const SizedBox(height: MegamartSize.spaceBetweenItems,),
                  ///Address
                  BillingAddressSection()
                ],
              ),
              )
            ],
          ),
        
          
          ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=>  SuccessScreen(
          image: MegamartImages.successfulpayment,
          title: 'Payment Success!', subtitle: 'Your items wil be shipped',
          onPressed: () async => Get.offAll(NavigationMenu()),
          ),
          
          ), child: Text('Checkout \$265')),
      ),
    );
  }
}
