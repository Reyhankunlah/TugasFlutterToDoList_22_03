import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';

class CustomButton extends StatelessWidget {
  final String myText;
  final Color textColor;
  final VoidCallback onPressed;
  final double radius;

  final bool isOutlined;
  final Color outlineColor;

  final bool isCircle;
  final double circleSize;

  final IconData? icon;
  final Color iconColor;
  final double iconSize;

  final Color backColor;

  const CustomButton({
    super.key,
    required this.myText,
    this.textColor = CustomColor.black,
    required this.onPressed,
    this.radius = 12,
    this.isOutlined = false,
    this.outlineColor = CustomColor.black,
    this.isCircle = false,
    this.circleSize = 56,
    this.icon,
    this.iconColor = CustomColor.black,
    this.iconSize = 20,
    this.backColor = const Color.fromARGB(0, 255, 0, 0),
  });

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      if (isOutlined) {
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            side: BorderSide(color: outlineColor, width: 2),
            fixedSize: Size(circleSize, circleSize),
            padding: EdgeInsets.zero,
            backgroundColor: backColor,
            foregroundColor: textColor,
          ),
          child: Icon(icon, color: iconColor, size: iconSize),
        );
      } else {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: Size(circleSize, circleSize),
            padding: EdgeInsets.zero,
            backgroundColor: backColor,
            foregroundColor: textColor,
            elevation: 3,
          ),
          onPressed: onPressed,
          child: Icon(icon, color: iconColor, size: iconSize),
        );
      }
    } else {
      if (isOutlined) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: outlineColor, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            backgroundColor: backColor,
            foregroundColor: textColor,
          ),
          onPressed: onPressed,
          child: _buildContent(textColor),
        );
      } else {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            backgroundColor: backColor, // ✅ fix
            foregroundColor: textColor,
            elevation: 3,
          ),
          onPressed: onPressed,
          child: _buildContent(textColor),
        );
      }
    }
  }

  Widget _buildContent(Color textColor) {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: iconSize),
          if (myText.isNotEmpty) const SizedBox(width: 8),
          if (myText.isNotEmpty)
            Text(
              myText,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
        ],
      );
    } else {
      return Text(
        myText,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      );
    }
  }
}
