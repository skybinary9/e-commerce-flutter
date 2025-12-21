import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/widget/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
               children: [
                //home appbar
                HomeAppBar()
                //search bar
                //category list
               ],
              
              ),
              
            ),
          ],
        ),
      )
    );
  }
}
