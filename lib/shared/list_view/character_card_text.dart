import 'package:flutter/material.dart';

class CharacterCardText extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;

  const CharacterCardText({
    Key key,
    @required this.label,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
