import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_Header.dart';
import 'package:flutter_todolist/Components/custom_button.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_profileCard.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class WideprofilePage extends StatelessWidget {
  WideprofilePage({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),

          const CustomHeader(judulHeader: 'Profile'),

          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        CustomProfilecard(
                          name: "Agustinus Galih Gumilang",
                          kelas: "11 PPLG 02",
                          absen: "03",
                          email: "agustinus9141@gmail.com",
                          imagePath: "assets/agustinus.jpg",
                          width: 350,
                          backColor: CustomColor.white,
                        ),
                        CustomProfilecard(
                          name: "Muhammad Al Fa'iz",
                          kelas: "11 PPLG 02",
                          absen: "22",
                          email: "faizgamer@gmail.com",
                          imagePath: "assets/faiz.jpg",
                          width: 350,
                          backColor: CustomColor.white,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    left: 30,
                    right: 30,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: CustomButton(
                      myText: "LOGOUT",
                      textColor: CustomColor.black,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Logout'),
                              content: const Text(
                                'Apakah Anda yakin ingin logout?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Batal'),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
