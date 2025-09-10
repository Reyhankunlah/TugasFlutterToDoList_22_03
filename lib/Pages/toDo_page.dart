import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
      appBar: AppBar(
        title: const Text("Add New Task"),
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            CustomColor.bluePrimary, // beda warna dengan background
      ),
      body: Stack(
        children: [
          // Background dasar
          Container(color: CustomColor.blue),

          // Lingkaran dekorasi
          Positioned(
            left: -301,
            top: 367,
            child: Container(
              width: 635,
              height: 635,
              decoration: const ShapeDecoration(
                color: CustomColor.Circle2,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 230,
            top: -253,
            child: Container(
              width: 635,
              height: 635,
              decoration: const ShapeDecoration(
                color: CustomColor.Circle2,
                shape: OvalBorder(),
              ),
            ),
          ),

          // Konten Form
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "Task Information",
                      style: fontColor(
                        CustomColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Task Name
                    CustomTextField(
                      controller: nameController,
                      label: "Task Name",
                    ),
                    const SizedBox(height: 16),

                    // Status
                    CustomDropdown(
                      label: "Status",
                      value: selectedStatus,
                      items: statusOptions,
                      onChanged: (val) => selectedStatus = val,
                    ),
                    const SizedBox(height: 16),

                    // Due Date
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

                    // Add Task Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.blueSecondary,
                          foregroundColor: CustomColor.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
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
                        child: const Text(
                          "Add Task",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
