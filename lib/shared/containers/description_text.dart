import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;

  const DescriptionText({
    this.label,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
