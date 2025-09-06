import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String myText;
  final Color myTextColor;
  final VoidCallback onPressed;
  final double radius;

  // Outline
  final bool isOutlined;
  final Color outlineColor;

  const CustomButton({
    super.key,
    required this.myText,
    required this.myTextColor,
    required this.onPressed,
    this.radius = 12,
    this.isOutlined = false,
    this.outlineColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: outlineColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
        onPressed: onPressed,
        child: Text(
          myText,
          style: TextStyle(color: outlineColor, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
        onPressed: onPressed,
        child: Text(
          myText,
          style: TextStyle(color: myTextColor, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
