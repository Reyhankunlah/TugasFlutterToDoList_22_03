// lib/components/task_card.dart
import 'package:flutter/material.dart';
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
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Due: ${task.dueDate != null ? task.dueDate!.toLocal().toString().split(' ').first : '-'}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
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
              Text("Status: ${task.status.name}"),
              Text(
                "Tags: ${task.tags.isNotEmpty ? task.tags.join(', ') : '-'}",
              ),
              Text(
                "Date: ${task.dueDate != null ? "${task.dueDate!.day}-${task.dueDate!.month}-${task.dueDate!.year}" : '-'}",
              ),
              const SizedBox(height: 8),

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
