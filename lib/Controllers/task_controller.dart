import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  // 🔹 daftar task
  RxList<Task> tasks = <Task>[].obs;

  // 🔹 controller untuk form tambah task
  final titleC = TextEditingController();
  DateTime? dueDate;
  final Rx<TaskStatus> status = TaskStatus.notStarted.obs;
  final RxList<String> selectedTags = <String>[].obs;

  // 🔹 daftar bulan (Indonesia)
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

  // 🔹 helper untuk format tanggal jadi "16 September 2025"
  String formatDate(DateTime date) {
    return "${date.day} ${bulan[date.month - 1]} ${date.year}";
  }

  // 🔹 enum -> label cantik
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

  // 🔹 label -> enum
  void setStatusFromLabel(String label) {
    if (label == "Not Started") {
      status.value = TaskStatus.notStarted;
    } else if (label == "In Progress") {
      status.value = TaskStatus.inProgress;
    } else if (label == "Completed") {
      status.value = TaskStatus.completed;
    }
  }

  // 🔹 Tambah task langsung (dipanggil dari form)
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

    final task = Task(
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

    // reset form
    titleC.clear();
    status.value = TaskStatus.notStarted;
    dueDate = null;
    selectedTags.clear();
  }

  // 🔹 Tambah task ke list
  void addTask(Task task) => tasks.add(task);

  // 🔹 Update task berdasarkan index
  void updateTask(int index, Task task) {
    if (index < 0 || index >= tasks.length) return;
    tasks[index] = task;
  }

  // 🔹 Hapus task berdasarkan index
  void removeTask(int index) {
    if (index < 0 || index >= tasks.length) return;
    tasks.removeAt(index);
  }

  // 🔹 Filter task berdasarkan status
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
      tasks.addAll([
        Task(
          title: "Dummy #1",
          status: TaskStatus.notStarted,
          dueDate: DateTime.now(),
          tags: ["Work"],
        ),
        Task(
          title: "Dummy #2",
          status: TaskStatus.inProgress,
          dueDate: DateTime.now(),
          tags: ["Personal"],
        ),
        Task(
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
