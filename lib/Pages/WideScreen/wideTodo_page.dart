import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:get/get.dart';

class WidetodoPage extends StatelessWidget {
  WidetodoPage({super.key});

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
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  // Bagian kiri - Logo atau ilustrasi
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/tulist_logo.png',
                          fit: BoxFit.contain,
                          width: constraints.maxWidth * 0.25,
                        ),
                      ),
                    ),
                  ),

                  // Bagian kanan - Form
                  Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 420),
                          child: Card(
                            color: CustomColor.white,
                            elevation: 6,
                            shadowColor: CustomColor.blueSecondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, bottom: 10),
                                    child: CustomText(
                                      myText: "Task Information",
                                      fontColor: CustomColor.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: CustomTextField(
                                      controller: taskController.titleC,
                                      label: "Task Name",
                                    ),
                                  ),

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
                                          dateController.text =
                                              taskController.formatDate(date);
                                        }
                                      },
                                      suffixIcon: const Icon(Icons.calendar_today),
                                    ),
                                  ),

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

                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: CustomButton(
                                          myText: 'ADD TASK',
                                          backColor: CustomColor.white,
                                          onPressed: () async {
                                            await taskController.addFromForm();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
