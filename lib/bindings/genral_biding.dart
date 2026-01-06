// lib/bindings/general_binding.dart
import 'package:ecommerce_final_year_project/data/repositories/cetagory_repositry.dart';
import 'package:ecommerce_final_year_project/features/authentication/controllers/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_final_year_project/features/shop/controllers/cetagories_controller.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    print('GeneralBinding initializing dependencies...');
    
    // Network Manager (permanent singleton)
    Get.put(NetworkManager(), permanent: true);
    
    // Repositories
    Get.put(CategoryRepository());
    
    // Controllers
    Get.put(CategoriesController(), permanent: true);
    Get.put(ForgetPasswordController(), permanent: true);
    
    print('All dependencies initialized in GeneralBinding');
  }
}