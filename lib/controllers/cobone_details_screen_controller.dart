import 'package:get/get.dart';
import 'package:lilian_tech_task/models/cobone.dart';

class CoboneDetailsScreenController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    currentCobone = Get.arguments;
    if(currentCobone == null){
      Get.back();
    }
  }

  Cobone? currentCobone;
  final RxInt _activeDottedIndex = RxInt(0);

  int get activeDottedIndex => _activeDottedIndex.value;
  set activeDottedIndex(int i) => _activeDottedIndex.value = i;
}