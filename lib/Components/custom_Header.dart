import 'package:flutter/widgets.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_text.dart';

class CustomHeader extends StatelessWidget {
  final String judulHeader;
  const CustomHeader({super.key, required this.judulHeader});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 640;

        if (isMobile) {
          return Stack(
            children: [
              // Header Background
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 450,
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

              // Oval Dekorasi
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
        } else {
          // 💻 Tampilan untuk Tablet / Layar Lebar
          return Stack(
            children: [
              // Header Background
              Positioned(
                top: 0,
                child: Container(
                  margin: EdgeInsets.only(right: 25),
                  width: 785,
                  height: 78,
                  decoration: const ShapeDecoration(
                    color: CustomColor.bluePrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),

              // Oval Dekorasi
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
      },
    );
  }
}
