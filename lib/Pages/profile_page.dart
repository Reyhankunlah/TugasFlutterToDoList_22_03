import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_Header.dart';
import 'package:flutter_todolist/Components/custom_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Center(
        child: Container(
          child: Stack(
            children: [
              BackDecoration(),

              CustomHeader(judulHeader: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
