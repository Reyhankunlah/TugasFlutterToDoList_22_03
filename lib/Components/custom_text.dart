import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String myText;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;

  const CustomText({
    super.key,
    required this.myText,
    this.fontColor = Colors.black87,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        myText,
        textAlign: align,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
