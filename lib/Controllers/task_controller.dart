import 'package:flutter/material.dart';
import 'package:flutter_todolist/Database/db_halper.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Models/task_model.dart';

class TaskController extends GetxController {
  final DBHelper dbHelper = DBHelper();

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  final titleC = TextEditingController();
  DateTime? dueDate;
  final Rx<TaskStatus> status = TaskStatus.notStarted.obs;
  final RxList<String> selectedTags = <String>[].obs;

  final List<String> tagsOptions = ["Work", "Personal", "Urgent"];

  final List<String> statusOptions = [
    "Not Started",
    "In Progress",
    "Completed",
  ];

  void setStatusFromLabel(String label) {
    switch (label) {
      case "In Progress":
        status.value = TaskStatus.inProgress;
        break;
      case "Completed":
        status.value = TaskStatus.completed;
        break;
      default:
        status.value = TaskStatus.notStarted;
    }
  }

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

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  // CRUD LOGIC

  Future<void> loadTasks() async {
    final data = await dbHelper.getTasks();
    tasks.assignAll(data);
  }

  Future<void> addFromForm() async {
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

    final newTask = TaskModel(
      title: title,
      status: status.value,
      dueDate: dueDate,
      tags: selectedTags.toList(),
    );

    await dbHelper.insertTask(newTask);
    await loadTasks();

    for (var t in tasks) {
      print("${t.id} | ${t.title} | ${t.status} | ${t.dueDate}");
    }

    Get.back();
    Get.snackbar(
      "Sukses",
      "Task berhasil ditambahkan",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
    );

    titleC.clear();
    dueDate = null;
    selectedTags.clear();
    status.value = TaskStatus.notStarted;
  }

  Future<void> deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    await loadTasks();
  }

  Future<void> updateTask(int index, TaskModel updatedTask) async {
    await dbHelper.updateTask(updatedTask);
    await loadTasks();
  }

  List<TaskModel> get notStarted =>
      tasks.where((t) => t.status == TaskStatus.notStarted).toList();
  List<TaskModel> get inProgress =>
      tasks.where((t) => t.status == TaskStatus.inProgress).toList();
  List<TaskModel> get completed =>
      tasks.where((t) => t.status == TaskStatus.completed).toList();

  @override
  void onClose() {
    titleC.dispose();
    super.onClose();
  }
}

extension TaskStatusExtension on TaskStatus {
  String get label {
    switch (this) {
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.completed:
        return "Completed";
      case TaskStatus.notStarted:
      default:
        return "Not Started";
    }
  }
}
