import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/layout/responsive_controller.dart';
import 'package:flutter_todolist/Pages/MobileScreen/history_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideHistory_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class HistoryTransform extends StatelessWidget {
  HistoryTransform({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          controller.updateLayout(constrains);
          return Obx(
            () => controller.isMobile.value ? HistoryPage() : WidehistoryPage(),
          );
        },
      ),
    );
  }
}
