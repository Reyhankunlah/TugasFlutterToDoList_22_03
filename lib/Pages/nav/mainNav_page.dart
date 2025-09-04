import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/nav/mainNav_controller.dart';
import 'package:get/get.dart';

class MainnavPage extends StatelessWidget {
  MainnavPage({super.key});

  final MainnavController mainnavController = Get.find<MainnavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: mainnavController.selectedIndex.value,
          children: mainnavController.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainnavController.selectedIndex.value,
          onTap: mainnavController.changeIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
