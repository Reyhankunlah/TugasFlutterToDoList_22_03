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

  String? get statusLabel {
    switch (status.value) {
      case TaskStatus.notStarted:
        return "Not Started";
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.completed:
        return "Completed";
    }
  }

  void setStatusFromLabel(String label) {
    if (label == "Not Started") {
      status.value = TaskStatus.notStarted;
    } else if (label == "In Progress") {
      status.value = TaskStatus.inProgress;
    } else if (label == "Completed") {
      status.value = TaskStatus.completed;
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

    final task = TaskModel(
      title: title,
      status: status.value,
      dueDate: dueDate,
      tags: selectedTags.toList(),
    );

    addTask(task);
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
    if (tasks.isEmpty) {
      tasks.addAll([
        TaskModel(
          title: "Dummy #1",
          status: TaskStatus.notStarted,
          dueDate: DateTime.now(),
          tags: ["Work"],
        ),
        TaskModel(
          title: "Dummy #2",
          status: TaskStatus.inProgress,
          dueDate: DateTime.now(),
          tags: ["Personal"],
        ),
        TaskModel(
          title: "Dummy #3",
          status: TaskStatus.completed,
          dueDate: DateTime.now(),
          tags: ["Urgent"],
        ),
      ]);
    }
  }

  @override
  void onClose() {
    titleC.dispose();
    super.onClose();
  }
}
