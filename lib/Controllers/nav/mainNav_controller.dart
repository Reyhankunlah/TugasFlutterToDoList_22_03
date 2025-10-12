import 'package:flutter/material.dart';
import 'package:flutter_todolist/Pages/Transform/history_transform.dart';
import 'package:flutter_todolist/Pages/Transform/home_transform.dart';
import 'package:flutter_todolist/Pages/Transform/profile_transform.dart';
import 'package:get/get.dart';

class MainnavController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeTransform(),
    HistoryTransform(),
    ProfileTransform(),
  ];

  void changeIndex(int i) => selectedIndex.value = i;
}
