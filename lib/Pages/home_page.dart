import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_Header.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_text.dart';
import 'package:flutter_todolist/Components/taskCard.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final taskC = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(
            judulHeader: 'Home',
          ), 
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
                    child: CustomText(
                      myText: 'NOT STARTED',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(() {
                    final allTasks = [...taskC.notStarted];
                    return ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(),
                      shrinkWrap: true, 
                      padding: const EdgeInsets.all(16),
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        final t = allTasks[index];
                        return TaskCard(task: t, showEdit: true);
                      },
                    );
                  }),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
                    child: CustomText(
                      myText: 'IN PROGRESS',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(() {
                    final allTasks = [...taskC.inProgress];
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16),
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        final t = allTasks[index];
                        return TaskCard(task: t, showEdit: true);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),

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
}
