import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text('Welcome to Megamart', style: TextStyle(color: MegamartColors.textWhite, fontSize: 24, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10),
                  const Text('Your one-stop shop for everything!', style: TextStyle(color: MegamartColors.textWhite, fontSize: 16),),
                ],
              
              ),
              
            ),
          ],
        ),
      )
    );
  }
}