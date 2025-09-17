import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_Header.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_profileCard.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomProfilecard(
                    name: "Agustinus Galih Gumilang",
                    kelas: "11 PPLG 02",
                    absen: "03",
                    email: "agustinus9141@gmail.com",
                    imagePath: "assets/agustinus.jpg",
                  ),
                ),

                CustomProfilecard(
                  name: "Muhhamad Al Fa'iz",
                  kelas: "11 PPLG 02",
                  absen: "22",
                  email: "faizgamer@gmail.com",
                  imagePath: "assets/faiz.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
