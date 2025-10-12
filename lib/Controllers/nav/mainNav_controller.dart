import 'package:flutter/material.dart';
import 'package:flutter_todolist/Pages/MobileScreen/history_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/profile_page.dart';
import 'package:flutter_todolist/Pages/Transform/home_transform.dart';
import 'package:get/get.dart';

class MainnavController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [HomeTransform(), HistoryPage(), ProfilePage()];

  void changeIndex(int i) => selectedIndex.value = i;
}
