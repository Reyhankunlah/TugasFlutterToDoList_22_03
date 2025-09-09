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
          // Background
          Container(
            width: 367,
            height: 800,
            decoration: const BoxDecoration(color: CustomColor.Circle),
          ),

          // Shape decorations
          Positioned(
            left: -301,
            top: 367,
            child: Container(
              width: 635,
              height: 635,
              decoration: const ShapeDecoration(
                color: CustomColor.Circle2,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 230,
            top: -253,
            child: Container(
              width: 635,
              height: 635,
              decoration: const ShapeDecoration(
                color:CustomColor.Circle2,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 367,
              height: 78,
              decoration: const ShapeDecoration(
                color: CustomColor.bluePrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 235,
            top: -231,
            child: Container(
              width: 635,
              height: 384,
              decoration: const ShapeDecoration(
                color: Color(0x19F7F9FF),
                shape: OvalBorder(),
              ),
            ),
          ),
          const Positioned(
            left: 17,
            top: 21,
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Bebas Neue',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // Task List pakai Obx
          Positioned.fill(
            top: 100, // biar gak ketutup header
            child: Obx(() {
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
          ),

          // Floating Button
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
