import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/editTodo_Controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class EditTodoPage extends StatelessWidget {
  EditTodoPage({super.key});

  final c = Get.find<EditTodoController>();

  final List<String> statusOptions = [
    "Not Started",
    "In Progress",
    "Completed",
  ];
  final List<String> tagsOptions = ["Work", "Personal", "Urgent"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: c.titleC, label: "Name Task"),
            const SizedBox(height: 16),
            Obx(
              () => CustomDropdown(
                label: "Status",
                value: _mapStatusToString(c.status.value),
                items: statusOptions,
                onChanged: (val) {
                  if (val != null) c.changeStatus(_mapStringToStatus(val));
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: c.dueDateC,
              label: "Due Date",
              readOnly: true,
              onTap: () => c.pickDate(context),
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            const SizedBox(height: 16),
            Obx(
              () => CustomDropdown(
                label: "Tags",
                value: c.selectedTag.value.isNotEmpty
                    ? c.selectedTag.value
                    : null,
                items: tagsOptions,
                onChanged: (val) {
                  if (val != null) c.selectedTag.value = val;
                },
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: c.save,
                icon: const Icon(Icons.save),
                label: const Text("Simpan Perubahan"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _mapStatusToString(TaskStatus status) {
    return switch (status) {
      TaskStatus.inProgress => "In Progress",
      TaskStatus.completed => "Completed",
      _ => "Not Started",
    };
  }

  static TaskStatus _mapStringToStatus(String value) {
    return switch (value) {
      "In Progress" => TaskStatus.inProgress,
      "Completed" => TaskStatus.completed,
      _ => TaskStatus.notStarted,
    };
  }
}
