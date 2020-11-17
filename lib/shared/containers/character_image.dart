import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String imagePath;
  final double borderRadiusValue;
  final double height;

  const CharacterImage({
    Key key,
    @required this.imagePath,
    this.borderRadiusValue = 50,
    this.height = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
        height: height,
      ),
    );
  }
}
