import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/taskCard.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Models/task_model.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final taskC = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final cp = taskC.completed;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [_section("COMPLETED", cp)],
        );
      }),
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
        ...data.map((t) => TaskCard(task: t)).toList(),
      ],
    );
  }
}
