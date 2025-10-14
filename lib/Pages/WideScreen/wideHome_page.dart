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
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WidehomePage extends StatelessWidget {
  WidehomePage({super.key});

  final taskC = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(judulHeader: "Home"),
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
                      fontSize: 19,
                    ),
                  ),
                  Obx(() {
                    final allTasks = taskC.notStarted;
                    if (allTasks.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          margin: EdgeInsets.only(left: 6),
                          child: CustomText(
                            myText: "Belum ada task Not Started.",
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16),
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        final t = allTasks[index];
                        return TaskCard(task: t, showEdit: true);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                          ),
                    );
                  }),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
                    child: CustomText(
                      myText: 'IN PROGGRESS',
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Obx(() {
                    final allTasks = taskC.inProgress;
                    if (allTasks.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          margin: EdgeInsets.only(left: 6),
                          child: CustomText(
                            myText: "Belum ada task In Proggress.",
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16),
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        final t = allTasks[index];
                        return TaskCard(task: t, showEdit: true);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                          ),
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
              onPressed: () => Get.toNamed(AppRoutes.todoTransform),
              isCircle: true,
              icon: Icons.add_rounded,
              iconSize: 30,
              textColor: CustomColor.white,
              backColor: CustomColor.bluePrimary,
              iconColor: CustomColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
