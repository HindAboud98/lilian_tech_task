import 'package:get/get.dart';
import 'package:lilian_tech_task/controllers/cobone_details_screen_controller.dart';

class CoboneDetailsScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<CoboneDetailsScreenController>(CoboneDetailsScreenController());
  }

}