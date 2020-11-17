import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/containers/description_text.dart';

class AboutSection extends StatelessWidget {
  final String status;
  final String species;
  final String gender;
  final String locationName;

  const AboutSection({
    Key key,
    this.status,
    this.species,
    this.gender,
    this.locationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(
          label: 'About the chracter',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        DescriptionText(label: 'Status: $status'),
        DescriptionText(label: 'Specie: $species'),
        DescriptionText(label: 'Gender: $gender'),
        DescriptionText(
          label: 'Last known location: $locationName',
        ),
      ],
    );
  }
}
