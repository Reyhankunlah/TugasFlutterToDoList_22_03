import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:get/get.dart';

class SidenavPage extends StatelessWidget {
  SidenavPage({super.key});

  final MainnavController mainnavController = Get.find<MainnavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Row(
          children: [
            // === SIDE NAVIGATION BAR (selalu tampil) ===
            Container(
              width: 70,
              color: CustomColor.bluePrimary,
              child: Column(
                children: [
                  const SizedBox(height: 90),

                  // === Menu Icons ===
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildNavIcon(Icons.house, 0),
                        _buildNavIcon(Icons.history, 1),
                        _buildNavIcon(Icons.person, 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // === HALAMAN UTAMA ===
            Expanded(
              child: mainnavController
                  .pages[mainnavController.selectedIndex.value],
            ),
          ],
        ),
      ),
    );
  }

  // === FUNGSI MEMBUAT ICON NAVIGASI ===
  Widget _buildNavIcon(IconData icon, int index) {
    return Obx(() {
      final bool isSelected = mainnavController.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => mainnavController.changeIndex(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? CustomColor.blueSecondary
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white, 
                ),
              ),
              const SizedBox(height: 4),

              
              if (isSelected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: CustomColor.blueSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
