import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  final titleC = TextEditingController();
  DateTime? dueDate;
  final Rx<TaskStatus> status = TaskStatus.notStarted.obs;
  final RxList<String> selectedTags = <String>[].obs;

  final List<String> statusOptions = [
    "Not Started",
    "In Progress",
    "Completed",
  ];

  final List<String> tagsOptions = ["Work", "Personal", "Urgent"];

  final List<String> bulan = const [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  String formatDate(DateTime date) {
    return "${date.day} ${bulan[date.month - 1]} ${date.year}";
  }

  String getStatusLabel(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return "Not Started";
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.completed:
        return "Completed";
    }
  }

  void setStatusFromLabel(String label) {
    switch (label) {
      case "Not Started":
        status.value = TaskStatus.notStarted;
        break;
      case "In Progress":
        status.value = TaskStatus.inProgress;
        break;
      case "Completed":
        status.value = TaskStatus.completed;
        break;
    }
  }

  void addFromForm() {
    final title = titleC.text.trim();

    if (title.isEmpty || dueDate == null || selectedTags.isEmpty) {
      Get.snackbar(
        "Validasi",
        "Mohon isi semua field.",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(12),
      );
      return;
    }

    tasks.add(
      TaskModel(
        title: title,
        status: status.value,
        dueDate: dueDate,
        tags: selectedTags.toList(),
      ),
    );

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

  void addTask(TaskModel task) => tasks.add(task);

  List<TaskModel> get notStarted =>
      tasks.where((t) => t.status == TaskStatus.notStarted).toList();
  List<TaskModel> get inProgress =>
      tasks.where((t) => t.status == TaskStatus.inProgress).toList();
  List<TaskModel> get completed =>
      tasks.where((t) => t.status == TaskStatus.completed).toList();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    titleC.dispose();
    super.onClose();
  }
}
