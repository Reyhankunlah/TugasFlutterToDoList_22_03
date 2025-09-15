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

  @override
  void onInit() {
    super.onInit();
    taskCtrl = Get.find<TaskController>(); // ambil TaskController
  }

  // 🔹 enum -> label cantik
  String? get statusLabel {
    if (status.value == TaskStatus.notStarted) return null;
    switch (status.value) {
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.completed:
        return "Completed";
      default:
        return null;
    }
  }

  // 🔹 label -> enum
  void setStatusFromLabel(String label) {
    if (label == "Not Started") {
      status.value = TaskStatus.notStarted;
    } else if (label == "In Progress") {
      status.value = TaskStatus.inProgress;
    } else {
      status.value = TaskStatus.completed;
    }
  }

  // 🔹 Tambah task baru
  void add() {
    final title = titleC.text.trim();
    if (title.isEmpty ||
        status.value == TaskStatus.notStarted ||
        dueDate == null ||
        selectedTags.isEmpty) {
      Get.snackbar(
        "Validasi",
        "Mohon isi semua field.",
        snackPosition: SnackPosition.TOP,
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

    taskCtrl.addTask(task);
    Get.back();

    Get.snackbar(
      "Sukses",
      "Task berhasil ditambahkan.",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
    );

    titleC.clear();
    status.value = TaskStatus.notStarted;
    dueDate = null;
    selectedTags.clear();
  }

  @override
  void onClose() {
    titleC.dispose();
    super.onClose();
  }
}
