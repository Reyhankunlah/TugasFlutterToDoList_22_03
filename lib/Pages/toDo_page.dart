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

  final addtdController = Get.find<TaskController>();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColor.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColor.bluePrimary,
      ),
      body: Stack(
        children: [
          BackDecoration(),

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
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomText(
                        myText: "Task Information",
                        fontColor: CustomColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Task Name
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomTextField(
                        controller: addtdController.titleC,
                        label: "Task Name",
                      ),
                    ),

                    // Status
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Obx(
                        () => CustomDropdown(
                          label: "Status",
                          value: addtdController.statusLabel,
                          items: addtdController
                              .statusOptions, // ✅ dari controller
                          onChanged: (val) {
                            if (val != null) {
                              addtdController.setStatusFromLabel(val);
                            }
                          },
                        ),
                      ),
                    ),

                    // Due Date
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
                                addtdController.dueDate ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            addtdController.dueDate = date;
                            dateController.text = addtdController.formatDate(
                              date,
                            );
                          }
                        },
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                    ),

                    // Tags
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Obx(
                        () => CustomDropdown(
                          label: "Tags",
                          value: addtdController.selectedTags.isEmpty
                              ? null
                              : addtdController.selectedTags.first,
                          items:
                              addtdController.tagsOptions, // ✅ dari controller
                          onChanged: (val) {
                            addtdController.selectedTags.clear();
                            if (val != null) {
                              addtdController.selectedTags.add(val);
                            }
                          },
                        ),
                      ),
                    ),

                    // Add Task Button
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        myText: 'ADD TASK',
                        onPressed: () {
                          addtdController.addFromForm();
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
