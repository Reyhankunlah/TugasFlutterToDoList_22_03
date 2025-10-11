import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/layout/responsive_controller.dart';
import 'package:flutter_todolist/Pages/nav/mainNav_page.dart';
import 'package:flutter_todolist/Pages/nav/sideNav_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class NavTransform extends StatelessWidget {
  NavTransform({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          controller.updateLayout(constrains);
          return Obx(
            () => controller.isMobile.value ? MainnavPage() : SidenavPage(),
          );
        },
      ),
    );
  }
}
