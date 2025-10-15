import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_navIcon.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:get/get.dart';

class MainnavPage extends StatelessWidget {
  MainnavPage({super.key});

  final MainnavController mainnavController = Get.find<MainnavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: mainnavController.pages[mainnavController.selectedIndex.value],

        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: CustomColor.bluePrimary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => CustomNavIcon(
                  icon: Icons.house,
                  isSelected: mainnavController.selectedIndex.value == 0,
                  onTap: () => mainnavController.changeIndex(0),
                ),
              ),
              Obx(
                () => CustomNavIcon(
                  icon: Icons.history,
                  isSelected: mainnavController.selectedIndex.value == 1,
                  onTap: () => mainnavController.changeIndex(1),
                ),
              ),
              Obx(
                () => CustomNavIcon(
                  icon: Icons.person,
                  isSelected: mainnavController.selectedIndex.value == 2,
                  onTap: () => mainnavController.changeIndex(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
