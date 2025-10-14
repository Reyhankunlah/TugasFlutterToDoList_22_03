import 'package:flutter/material.dart';
import 'package:flutter_todolist/Database/db_halper.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';

class EditTodoController extends GetxController {
  final taskC = Get.find<TaskController>();
  final DBHelper dbHelper = DBHelper();

  final titleC = TextEditingController();
  final dueDateC = TextEditingController();

  var status = TaskStatus.notStarted.obs;
  var selectedTag = "".obs;
  DateTime? pickedDate;

  late int taskIndex;
  late TaskModel originalTask;

  @override
  void onInit() {
    super.onInit();

    taskIndex = Get.arguments as int;
    originalTask = taskC.tasks[taskIndex];

    titleC.text = originalTask.title;
    status.value = originalTask.status;

    if (originalTask.dueDate != null) {
      pickedDate = originalTask.dueDate;
      dueDateC.text = taskC.formatDate(originalTask.dueDate!);
    }

    if (originalTask.tags.isNotEmpty) {
      selectedTag.value = originalTask.tags.first;
    }
  }

  void changeStatus(TaskStatus newStatus) {
    status.value = newStatus;
  }

  void changeTag(TaskStatus newTag) {
    selectedTag.value = newTag.toString();
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      pickedDate = date;
      dueDateC.text = taskC.formatDate(date);
    }
  }

  Future<void> delete() async {
    if (originalTask.id == null) {
      Get.snackbar(
        "Gagal",
        "Task belum tersimpan di database.",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(12),
      );
      return;
    }

    await taskC.deleteTask(originalTask.id!);
    Get.back();
    Get.snackbar(
      "Sukses",
      "Task berhasil dihapus.",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
    );
  }

  Future<void> save() async {
    if (titleC.text.trim().isEmpty) {
      Get.snackbar(
        "Validasi",
        "Judul tidak boleh kosong",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(12),
      );
      return;
    }

    final updatedTask = TaskModel(
      id: originalTask.id,
      title: titleC.text.trim(),
      status: status.value,
      dueDate: pickedDate,
      tags: selectedTag.value.isNotEmpty ? [selectedTag.value] : [],
    );

    await dbHelper.updateTask(updatedTask);
    await taskC.loadTasks();

    Get.back();
    Get.snackbar(
      "Sukses",
      "Task berhasil diperbarui",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
    );
  }
}
