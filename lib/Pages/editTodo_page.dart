import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_dropdown.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/editTodo_Controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class EditTodoPage extends StatelessWidget {
  EditTodoPage({super.key});

  final edtContronller = Get.find<EditTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CustomTextField(
                controller: edtContronller.titleC,
                label: "Name Task",
              ),
            ),
            CustomDropdown(
              label: "Status",
              value: edtContronller.status.value.label,
              items: TaskStatus.values.map((s) => s.label).toList(),
              onChanged: (val) {
                if (val != null) {
                  final status = TaskStatus.values.firstWhere(
                    (s) => s.label == val,
                    orElse: () => TaskStatus.notStarted,
                  );
                  edtContronller.changeStatus(status);
                }
              },
            ),

            Padding(
              padding: EdgeInsets.only(top: 24),
              child: CustomButton(
                myText: "Simpan Perubahan",
                onPressed: edtContronller.save,
                icon: Icons.save,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
