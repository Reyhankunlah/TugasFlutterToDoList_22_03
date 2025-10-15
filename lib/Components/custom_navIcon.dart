import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';

class CustomNavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? CustomColor.blueSecondary
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, size: 25, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
