import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;

  void addTask(Task t) => tasks.add(t);
  void updateTask(int index, Task t) {
    if (index < 0 || index >= tasks.length) return;
    tasks[index] = t;
  }

  void removeTask(int index) {
    if (index < 0 || index >= tasks.length) return;
    tasks.removeAt(index);
  }

  List<Task> get notStarted =>
      tasks.where((t) => t.status == TaskStatus.notStarted).toList();
  List<Task> get inProgress =>
      tasks.where((t) => t.status == TaskStatus.inProgress).toList();
  List<Task> get completed =>
      tasks.where((t) => t.status == TaskStatus.completed).toList();

  @override
  void onInit() {
    super.onInit();
    if (tasks.isEmpty) {
      tasks.addAll(const [
        Task(title: "Dummy #1", status: TaskStatus.notStarted),
        Task(title: "Dummy #2", status: TaskStatus.inProgress),
        Task(title: "Dummy #3", status: TaskStatus.completed),
      ]);
    }
  }
}
