import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/layout/responsive_controller.dart';
import 'package:flutter_todolist/Pages/MobileScreen/home_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/toDo_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideHome_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideToDo_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class TodoTransform extends StatelessWidget {
  TodoTransform({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          controller.updateLayout(constrains);
          return Obx(
            () => controller.isMobile.value ? ToDoPage() : WidetodoPage(),
          );
        },
      ),
    );
  }
}
