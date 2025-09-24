import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class Authbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
