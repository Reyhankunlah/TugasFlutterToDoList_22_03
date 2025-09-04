import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;
  final bool isNumber;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        controller: controller,
        obscureText: isPassword,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
