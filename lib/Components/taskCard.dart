import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
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

    final List<String> bulan = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 640;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
      ),
      child: Stack(
        children: [
          // isi utama
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircleAvatar(backgroundColor: dotColor, radius: 12),
                  ),
                  Expanded(
                    child: CustomText(
                      myText: task.title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              Obx(() {
                if (!isExpanded.value) return const SizedBox();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    CustomText(
                      myText: "Tags: " + task.tags.join(', '),
                      fontSize: 12,
                    ),
                    CustomText(
                      myText:
                          "Due Date: ${task.dueDate!.day} ${bulan[task.dueDate!.month - 1]} ${task.dueDate!.year}",
                      fontSize: 12,
                    ),
                    if (showEdit)
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          iconColor: CustomColor.white,
                          myText: "",
                          onPressed: () {
                            final index = taskC.tasks.indexOf(task);
                            if (index != -1) {
                              Get.toNamed(
                                AppRoutes.editToDoPage,
                                arguments: index,
                              );
                            }
                          },
                          isCircle: true,
                          icon: Icons.edit,
                          iconSize: 20,
                          textColor: CustomColor.black,
                          backColor: CustomColor.blueSecondary,
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),

          Align(
            alignment: Alignment.topRight,
            child: Obx(
              () => IconButton(
                onPressed: () => isExpanded.value = !isExpanded.value,
                icon: Icon(
                  isExpanded.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
