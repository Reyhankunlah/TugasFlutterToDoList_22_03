import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Controllers/editTodo_Controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class EditTodoPage extends StatelessWidget {
  EditTodoPage({super.key});

  final edtController = Get.find<EditTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          myText: 'Edit Task',
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
              color: CustomColor.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomText(
                        myText: "Edit Task Information",
                        fontColor: CustomColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomTextField(
                        controller: edtController.titleC,
                        label: "Task Name",
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Obx(
                        () => CustomDropdown(
                          label: "Status",
                          value: edtController.status.value.label,
                          items: TaskStatus.values.map((s) => s.label).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              final status = TaskStatus.values.firstWhere(
                                (s) => s.label == val,
                                orElse: () => TaskStatus.notStarted,
                              );
                              edtController.changeStatus(status);
                            }
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Obx(
                        () => CustomDropdown(
                          label: "Tags",
                          value: edtController.selectedTag.value,
                          items: edtController.taskC.tagsOptions,
                          onChanged: (val) {
                            if (val != null) {
                              edtController.selectedTag.value = val;
                            }
                          },
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 12,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          child: CustomButton(
                            myText: "Delete",
                            onPressed: edtController.delete,
                            icon: Icons.delete_forever,
                            backColor: CustomColor.red,
                            iconColor: CustomColor.white,
                            textColor: CustomColor.white,
                            outlineColor: CustomColor.red,
                            isOutlined: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          child: CustomButton(
                            myText: "Save",
                            onPressed: edtController.save,
                            icon: Icons.save,
                            backColor: CustomColor.white,
                            isOutlined: true,
                          ),
                        ),
                      ],
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
