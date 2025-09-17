import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:get/get.dart';

class Mainnavbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainnavController>(() => MainnavController(), fenix: true);
  }
}
