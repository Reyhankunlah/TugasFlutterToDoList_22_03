import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:flutter_todolist/Components/taskCard.dart';
import 'package:flutter_todolist/Models/task_model.dart';

class CustomFullCard extends StatelessWidget {
  final String title;
  final List<Task> tasks;

  const CustomFullCard({super.key, required this.title, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header text
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          child: CustomText(myText: title, fontWeight: FontWeight.bold),
        ),

        // List of tasks
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true, // penting biar bisa ditaruh di dalam scroll lain
          physics:
              const NeverScrollableScrollPhysics(), // biar gak bentrok scroll
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final t = tasks[index];
            return TaskCard(task: t);
          },
        ),
      ],
    );
  }
}
