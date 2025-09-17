import 'package:flutter_todolist/Controllers/editTodo_Controller.dart';
import 'package:get/get.dart';

class Edittodobinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTodoController>(() => EditTodoController(), fenix: true);
  }
}
