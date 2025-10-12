import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_Header.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_profileCard.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(judulHeader: 'Profile'),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomProfilecard(
                    name: "Agustinus Galih Gumilang",
                    kelas: "11 PPLG 02",
                    absen: "03",
                    email: "agustinus9141@gmail.com",
                    imagePath: "assets/agustinus.jpg",
                    backColor: CustomColor.blue,
                  ),
                ),
                const CustomProfilecard(
                  name: "Muhhamad Al Fa'iz",
                  kelas: "11 PPLG 02",
                  absen: "22",
                  email: "faizgamer@gmail.com",
                  imagePath: "assets/faiz.jpg",
                ),
                CustomButton(
                  myText: "LOGOUT",
                  textColor: CustomColor.black,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content: const Text('Are you sure want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                authController.logout();
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
