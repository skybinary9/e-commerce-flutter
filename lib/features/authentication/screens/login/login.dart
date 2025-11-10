import 'package:ecommerce_final_year_project/common/styles/megamart_spacing_style.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/header_login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_footer.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_form.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

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
            children: const [
              /// 🟢 Header Section
              LoginHeader(),

              /// 🟢 Login Form Section
              LoginForm(),

              /// 🟢 Footer Section
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

