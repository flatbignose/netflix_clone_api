import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.size,
    required this.textSize,
  });
  final IconData icon;
  final String text;
  final double size;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
