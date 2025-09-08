import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/taskCard.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final taskC = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            final ns = taskC.notStarted;
            final ip = taskC.inProgress;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _section("NOT STARTED", ns),
                const SizedBox(height: 12),
                _section("IN PROGRESS", ip),
              ],
            );
          }),
          Positioned(
            bottom: 20,
            right: 20,
            child: CustomButton(
              myText: "",
              onPressed: () => Get.toNamed(AppRoutes.toDoPage),
              isCircle: true,
              icon: Icons.add_rounded,
              iconSize: 30,
              textColor: CustomColor.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, List<Task> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
        const SizedBox(height: 8),
        ...data.map((t) => TaskCard(task: t, showEdit: true)).toList(),
      ],
    );
  }
}
