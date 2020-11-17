import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/containers/description_text.dart';

class OriginLocation extends StatelessWidget {
  final String name;
  final String dimension;
  final String type;

  const OriginLocation({
    Key key,
    this.name,
    this.dimension,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(
          label: 'Origin Location',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        DescriptionText(label: 'Name: $name'),
        DescriptionText(label: 'Dimension: $dimension'),
        DescriptionText(label: 'Type: $type'),
      ],
    );
  }
}
