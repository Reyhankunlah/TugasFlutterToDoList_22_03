import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class ToDoPage extends StatelessWidget {
  ToDoPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final List<String> statusOptions = [
    "Not Started",
    "In Progress",
    "Completed",
  ];
  final List<String> tagsOptions = ["Work", "Personal", "Urgent"];

  String? selectedStatus;
  String? selectedTag;
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    final taskC = Get.find<TaskController>();
    final navC = Get.find<MainnavController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            CustomTextField(controller: nameController, label: "Name Task"),
            const SizedBox(height: 16),

            // Status
            CustomDropdown(
              label: "Status",
              value: selectedStatus,
              items: statusOptions,
              onChanged: (val) => selectedStatus = val,
            ),
            const SizedBox(height: 16),

            // Date
            CustomTextField(
              controller: dateController,
              label: "Due Date",
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  pickedDate = date;
                  dateController.text =
                      "${date.day}-${date.month}-${date.year}";
                }
              },
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            const SizedBox(height: 16),

            // Tags
            CustomDropdown(
              label: "Tags",
              value: selectedTag,
              items: tagsOptions,
              onChanged: (val) => selectedTag = val,
            ),
            const SizedBox(height: 24),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.trim().isEmpty ||
                      selectedStatus == null) {
                    Get.snackbar(
                      "Error",
                      "Nama & Status harus diisi",
                      snackPosition: SnackPosition.TOP,
                    );
                    return;
                  }

                  final statusEnum = switch (selectedStatus) {
                    "In Progress" => TaskStatus.inProgress,
                    "Completed" => TaskStatus.completed,
                    _ => TaskStatus.notStarted,
                  };

                  final newTask = Task(
                    title: nameController.text.trim(),
                    status: statusEnum,
                    dueDate: pickedDate,
                    tags: selectedTag != null ? [selectedTag!] : [],
                  );

                  taskC.addTask(newTask);
                  navC.changeIndex(0);
                  Get.back();

                  // reset
                  nameController.clear();
                  dateController.clear();
                  pickedDate = null;
                  selectedStatus = null;
                  selectedTag = null;

                  Get.snackbar(
                    "Sukses",
                    "Task ditambahkan",
                    snackPosition: SnackPosition.TOP,
                  );
                },
                child: const Text("Add Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
