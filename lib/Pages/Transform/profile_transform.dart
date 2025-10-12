import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/layout/responsive_controller.dart';
import 'package:flutter_todolist/Pages/MobileScreen/profile_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideProfile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ProfileTransform extends StatelessWidget {
  ProfileTransform({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          controller.updateLayout(constrains);
          return Obx(
            () => controller.isMobile.value ? ProfilePage() : WideprofilePage(),
          );
        },
      ),
    );
  }
}
