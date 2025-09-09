import 'package:flutter/material.dart';

class CustomColor {
  static const Color bluePrimary = Color(0xFF4365FF);
  static const Color blueSecondary = Color(0xFF1F41BB);
  static const Color whiteShadows = Color.fromARGB(7, 133, 157, 242);
  static const Color orange = Colors.amber;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color elementInactive1 = Colors.black54;
  static const Color elementInactive2 = Colors.black26;
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color Circle = Color(0xFFEDF6FF);
  static const Color Circle2 = Color(0xFFF2FEFF);
}

TextStyle fontColor(
  Color color, {
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}
