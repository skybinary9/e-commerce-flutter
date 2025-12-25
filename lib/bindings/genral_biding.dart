import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBidding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }


}