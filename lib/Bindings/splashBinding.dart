import 'package:flutter_todolist/Controllers/splash_controller.dart';
import 'package:get/get.dart';

class Splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  }
}
