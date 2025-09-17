import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:flutter_todolist/Controllers/editTodo_Controller.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:get/get.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => EditTodoController(), fenix: true);
    Get.lazyPut(() => MainnavController(), fenix: true);
    Get.lazyPut(() => TaskController(), fenix: true);
  }
}
