import 'package:flutter/widgets.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/components/custom_text.dart';

class CustomHeader extends StatelessWidget {
  final String judulHeader;
  CustomHeader({required this.judulHeader});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Header Background
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 367,
            height: 78,
            decoration: const ShapeDecoration(
              color: CustomColor.bluePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 235,
          top: -231,
          child: Container(
            width: 635,
            height: 384,
            decoration: const ShapeDecoration(
              color: CustomColor.grey,
              shape: OvalBorder(),
            ),
          ),
        ),

        // Header Text
        Positioned(
          left: 17,
          top: 21,
          child: CustomText(
            myText: judulHeader,
            fontColor: CustomColor.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
