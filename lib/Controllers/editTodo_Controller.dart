import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';

class EditTodoController extends GetxController {
  final taskC = Get.find<TaskController>();

  // controller untuk form
  final titleC = TextEditingController();
  final dueDateC = TextEditingController();

  // reactive values
  var status = TaskStatus.notStarted.obs;
  var selectedTag = "".obs;
  DateTime? pickedDate;

  // index task yang sedang diedit
  late int taskIndex;

  @override
  void onInit() {
    super.onInit();
    // ambil index dari argument
    taskIndex = Get.arguments as int;
    final task = taskC.tasks[taskIndex];

    // isi form dengan data lama
    titleC.text = task.title;
    status.value = task.status;
    if (task.dueDate != null) {
      pickedDate = task.dueDate;
      dueDateC.text =
          "${task.dueDate!.day}-${task.dueDate!.month}-${task.dueDate!.year}";
    }
    if (task.tags.isNotEmpty) {
      selectedTag.value = task.tags.first;
    }
  }

  // ganti status
  void changeStatus(TaskStatus newStatus) {
    status.value = newStatus;
  }

  // pilih tanggal
  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      pickedDate = date;
      dueDateC.text = "${date.day}-${date.month}-${date.year}";
    }
  }

  // simpan perubahan
  void save() {
    final updatedTask = Task(
      title: titleC.text.trim(),
      status: status.value,
      dueDate: pickedDate,
      tags: selectedTag.value.isNotEmpty ? [selectedTag.value] : [],
    );

    // update berdasarkan index
    taskC.tasks[taskIndex] = updatedTask;
    taskC.tasks.refresh();

    Get.back();
    Get.snackbar(
      "Sukses",
      "Task berhasil diperbarui",
      snackPosition: SnackPosition.TOP,
    );
  }
}
