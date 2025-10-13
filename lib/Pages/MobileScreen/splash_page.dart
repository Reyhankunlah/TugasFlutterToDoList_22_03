import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final splash = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: Center(
        child: Image.asset(
          "assets/tulist_anim.gif",
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
