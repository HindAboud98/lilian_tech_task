import 'package:get/get.dart';
import 'package:lilian_tech_task/controllers/home_screen_controller.dart';
import 'package:lilian_tech_task/controllers/tabs_controllers/home_tab_controller.dart';

class HomeScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeTabController>(HomeTabController());
    Get.put<HomeScreenController>(HomeScreenController());
  }

}