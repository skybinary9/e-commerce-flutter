import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/update_gender_controller.dart' show ChangeGenderController;
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChangeGenderScreen extends StatelessWidget {
  const ChangeGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeGenderController());

    return Scaffold(

      appBar: const EAppbar(
        title: Text('Change Gender'),
        showbackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() => Column(
                  children: [
                    RadioListTile(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) =>
                          controller.selectedGender.value = value!,
                    ),
                    RadioListTile(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) =>
                          controller.selectedGender.value = value!,
                    ),
                    RadioListTile(
                      title: const Text('Other'),
                      value: 'Other',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) =>
                          controller.selectedGender.value = value!,
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.updateGender,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
