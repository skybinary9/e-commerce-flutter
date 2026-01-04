import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/oder/widget/oder_list.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class OderScreen extends StatelessWidget {
  const OderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(title: Text('My Oder', style: Theme.of(context).textTheme.headlineSmall,), showbackArrow: true,),
      body: Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
      child: OderList(),
      ),
    );
  }
}