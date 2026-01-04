import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OderList extends StatelessWidget {
  const OderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, _) => const SizedBox(height: MegamartSize.spaceBetweenItems),
      itemBuilder: (_, _) => AppCircularContainer(
        showBorder: true,
        padding: const EdgeInsets.all(MegamartSize.md),
        backgroundColor: dark ? MegamartColors.dark : MegamartColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1: Status and Date
            Row(
              children: [
                // Status Icon and Text
                Icon(
                  Iconsax.box,
                  size: MegamartSize.iconSm,
                  color: MegamartColors.primary,
                ),
                const SizedBox(width: MegamartSize.spaceBetweenItems / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: MegamartColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text(
                        '07 Nov 2024',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                
                // Order ID Section with Arrow Button
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Order',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontWeightDelta: 1,
                              ),
                        ),
                        Text(
                          '#256f2',
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                                color: dark ? MegamartColors.light : MegamartColors.dark,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(width: MegamartSize.spaceBetweenItems / 2),
                    // Arrow Button - next to Order section
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: dark ? MegamartColors.darkerGray : MegamartColors.grey.withOpacity(0.3),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.arrow_right_3,
                          size: MegamartSize.iconSm,
                          color: dark ? MegamartColors.light : MegamartColors.dark,
                        ),
                        padding: const EdgeInsets.all(6),
                        visualDensity: VisualDensity.compact,
                        constraints: const BoxConstraints(),
                        iconSize: MegamartSize.iconSm,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: MegamartSize.spaceBetweenItems),
            
            // Divider
            Divider(
              color: dark ? MegamartColors.darkerGray : MegamartColors.grey,
              thickness: 0.5,
            ),
            
            const SizedBox(height: MegamartSize.spaceBetweenItems),
            
            // Row 2: Showing Date
            Row(
              children: [
                // Calendar Icon and Text
                Icon(
                  Iconsax.calendar,
                  size: MegamartSize.iconSm,
                  color: dark ? MegamartColors.light : MegamartColors.dark,
                ),
                const SizedBox(width: MegamartSize.spaceBetweenItems / 2),
                Expanded(
                  child: Text(
                    'Showing Date',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontWeightDelta: 1,
                        ),
                  ),
                ),
                Text(
                  '03 Feb 2025',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? MegamartColors.light : MegamartColors.dark,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}