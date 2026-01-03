
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:flutter/material.dart';

class EAppIndicaotr extends StatelessWidget {
  const EAppIndicaotr({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium,)),
            Expanded(
              flex: 11,
              child: SizedBox(
                width: MegamartDeviceUtility.getScreenwidth(context) * 0.5,
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 11,
                  backgroundColor: MegamartColors.grey,
                  valueColor: AlwaysStoppedAnimation(MegamartColors.primary),
                  borderRadius: BorderRadius.circular(7)
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}