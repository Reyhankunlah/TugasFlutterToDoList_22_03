import 'package:flutter/material.dart';
import 'custom_color.dart';

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
            const SizedBox(height: 12),

            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CustomColor.black,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              "$kelas\n$absen",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.elementInactive1,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.elementInactive2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
