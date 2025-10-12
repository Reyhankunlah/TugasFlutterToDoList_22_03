import 'package:flutter_todolist/Controllers/layout/responsive_controller.dart';
import 'package:get/get.dart';

class Responsivebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveController>(
      () => ResponsiveController(),
      fenix: true,
    );
  }
}
