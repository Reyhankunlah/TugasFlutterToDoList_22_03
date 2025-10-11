import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:get/get.dart';

class ToDoPage extends StatelessWidget {
  ToDoPage({super.key});

  final taskController = Get.find<TaskController>();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          myText: 'Add New Task',
          fontWeight: FontWeight.bold,
          fontColor: CustomColor.white,
        ),
        iconTheme: IconThemeData(color: CustomColor.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColor.bluePrimary,
      ),
      body: Stack(
        children: [
          BackDecoration(),
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
                    // ===== TITLE =====
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomText(
                        myText: "Task Information",
                        fontColor: CustomColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // ===== TASK NAME =====
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomTextField(
                        controller: taskController.titleC,
                        label: "Task Name",
                      ),
                    ),

                    // ===== STATUS =====
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Obx(
                        () => CustomDropdown(
                          label: "Status",
                          value: taskController.status.value.label,
                          items: taskController.statusOptions,
                          onChanged: (val) {
                            if (val != null) {
                              taskController.setStatusFromLabel(val);
                            }
                          },
                        ),
                      ),
                    ),

                    // ===== DUE DATE =====
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomTextField(
                        controller: dateController,
                        label: "Due Date",
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate:
                                taskController.dueDate ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            taskController.dueDate = date;
                            dateController.text = taskController.formatDate(
                              date,
                            );
                          }
                        },
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                    ),

                    // ===== TAGS =====
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Obx(
                        () => CustomDropdown(
                          label: "Tags",
                          value: taskController.selectedTags.isEmpty
                              ? null
                              : taskController.selectedTags.first,
                          items: taskController.tagsOptions,
                          onChanged: (val) {
                            taskController.selectedTags.clear();
                            if (val != null) {
                              taskController.selectedTags.add(val);
                            }
                          },
                        ),
                      ),
                    ),

                    // ===== BUTTON =====
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        myText: 'ADD TASK',
                        onPressed: () async {
                          await taskController.addFromForm();
                        },
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
