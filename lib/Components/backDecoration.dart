import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';

class BackDecoration extends StatelessWidget {
  BackDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -301,
          top: 367,
          child: Container(
            width: 635,
            height: 635,
            decoration: const ShapeDecoration(
              color: CustomColor.Circle2,
              shape: OvalBorder(),
            ),
          ),
        ),

        // bulet kanan atas
        Positioned(
          left: 230,
          top: -253,
          child: Container(
            width: 635,
            height: 635,
            decoration: const ShapeDecoration(
              color: CustomColor.Circle2,
              shape: OvalBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
