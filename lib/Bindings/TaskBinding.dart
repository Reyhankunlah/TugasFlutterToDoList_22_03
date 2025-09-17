import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:get/get.dart';

class Taskbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController(), fenix: true);
  }
}
