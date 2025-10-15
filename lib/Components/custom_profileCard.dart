import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'custom_text.dart';

class CustomProfilecard extends StatelessWidget {
  final String name;
  final String kelas;
  final String absen;
  final String email;
  final String imagePath;

  final double? width;
  final double? height;

  final Color? backColor;

  const CustomProfilecard({
    super.key,
    required this.name,
    required this.kelas,
    required this.absen,
    required this.email,
    required this.imagePath,
    this.width,
    this.height,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: backColor,
      shadowColor: CustomColor.bluePrimary.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: CustomColor.blugrey.withOpacity(0.3),
              ),
              const SizedBox(height: 12),

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

              // Email
              CustomText(
                myText: email,
                fontColor: CustomColor.elementInactive2,
                fontSize: 14,
                align: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
