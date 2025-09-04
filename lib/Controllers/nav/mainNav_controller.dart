import 'package:flutter/material.dart';
import 'package:flutter_todolist/Pages/history_page.dart';
import 'package:flutter_todolist/Pages/home_page.dart';
import 'package:flutter_todolist/Pages/profile_page.dart';
import 'package:get/get.dart';

class MainnavController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];

  void changeIndex(int i) => selectedIndex.value = i;
}
