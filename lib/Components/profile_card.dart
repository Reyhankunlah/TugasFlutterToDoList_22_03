import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'custom_text.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String kelas;
  final String absen;
  final String email;
  final String imagePath;

  const ProfileCard({
    super.key,
    required this.name,
    required this.kelas,
    required this.absen,
    required this.email,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: CustomColor.blugrey.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: CustomColor.blugrey.withOpacity(0.3),
            ),

            CustomText(
              myText: name,
              fontColor: CustomColor.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
            ),

            CustomText(
              myText: "$kelas\n$absen",
              fontColor: CustomColor.elementInactive1,
              fontSize: 14,
              align: TextAlign.center,
            ),

            CustomText(
              myText: email,
              fontColor: CustomColor.elementInactive2,
              fontSize: 14,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
