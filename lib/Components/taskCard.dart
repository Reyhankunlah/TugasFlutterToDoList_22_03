// lib/components/task_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final bool showEdit;

  const TaskCard({super.key, required this.task, this.showEdit = false});

  @override
  Widget build(BuildContext context) {
    final dotColor = (task.status == TaskStatus.inProgress)
        ? CustomColor.orange
        : (task.status == TaskStatus.completed
              ? CustomColor.green
              : CustomColor.red);

    final isExpanded = false.obs;
    final taskC = Get.find<TaskController>();

    return Obx(
      () => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // row utama
            Row(
              children: [
                CircleAvatar(backgroundColor: dotColor, radius: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: CustomText(
                          myText: task.title,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: CustomText(
                          myText:
                              "Due: ${task.dueDate != null ? task.dueDate!.toLocal().toString().split(' ').first : '-'}",
                          fontColor: CustomColor.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => isExpanded.value = !isExpanded.value,
                  icon: Icon(
                    isExpanded.value
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 28,
                  ),
                ),
              ],
            ),

            if (isExpanded.value) ...[
              const Divider(),

              CustomText(
                myText:
                    "Tags: ${task.tags.isNotEmpty ? task.tags.join(', ') : '-'}",
                fontSize: 12,
              ),
              CustomText(
                myText:
                    "Date: ${task.dueDate != null ? "${task.dueDate!.day}-${task.dueDate!.month}-${task.dueDate!.year}" : '-'}",
                fontSize: 12,
              ),

              if (showEdit)
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    myText: "",
                    onPressed: () {
                      final index = taskC.tasks.indexOf(task);
                      if (index != -1) {
                        Get.toNamed(AppRoutes.editToDoPage, arguments: index);
                      }
                    },
                    isCircle: true,
                    icon: Icons.edit,
                    iconSize: 20,
                    textColor: CustomColor.black,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
