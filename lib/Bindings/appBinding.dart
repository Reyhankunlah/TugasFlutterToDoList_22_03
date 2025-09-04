import 'package:flutter_todolist/Controllers/loginPage_controller.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:get/get.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginpageController());
    Get.lazyPut(() => MainnavController(), fenix: true);
  }
}
