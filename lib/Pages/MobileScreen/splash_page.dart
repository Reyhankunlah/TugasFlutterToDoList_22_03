import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/splash_controller.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final splash = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:  Image.asset("assets/tulist_logo.png", height: 70)),
    );
  }
}
