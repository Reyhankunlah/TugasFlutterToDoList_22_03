import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class AddtodoController extends GetxController {
  final titleC = TextEditingController();
  DateTime? dueDate;
  final Rx<TaskStatus> status = TaskStatus.notStarted.obs;
  final RxList<String> selectedTags = <String>[].obs;

  late TaskController taskCtrl;
  int? editIndex; // null = tambah baru

  @override
  void onInit() {
    super.onInit();
    taskCtrl = Get.find<TaskController>();
    // jika dipanggil untuk edit, kirim index lewat Get.arguments
    if (Get.arguments is int) {
      editIndex = Get.arguments as int;
      final t = taskCtrl.tasks[editIndex!];
      titleC.text = t.title;
      status.value = t.status;
      dueDate = t.dueDate;
      selectedTags.assignAll(t.tags);
    }
  }

  void save() {
    final title = titleC.text.trim();
    if (title.isEmpty) {
      Get.snackbar(
        "Validasi",
        "Nama task tidak boleh kosong.",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
      );
      return;
    }

    final task = Task(
      title: title,
      status: status.value,
      dueDate: dueDate,
      tags: selectedTags,
    );

    if (editIndex == null) {
      taskCtrl.addTask(task);
      Get.back();
      Get.snackbar(
        "Sukses",
        "Task ditambahkan.",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
      );
    } else {
      taskCtrl.updateTask(editIndex!, task);
      Get.back();
      Get.snackbar(
        "Sukses",
        "Task diperbarui.",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
      );
    }
  }

  @override
  void onClose() {
    titleC.dispose();
    super.onClose();
  }
}
