import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
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
              _buildNavIcon(Icons.house, 0),
              _buildNavIcon(Icons.history, 1),
              _buildNavIcon(Icons.person, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return Obx(() {
      final bool isSelected = mainnavController.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => mainnavController.changeIndex(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? CustomColor.blueSecondary
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icon, size: 25, color: Colors.white),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: CustomColor.blueSecondary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      );
    });
  }
}
