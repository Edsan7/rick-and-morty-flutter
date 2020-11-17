import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/containers/description_text.dart';

class CharacterSearchResult extends StatelessWidget {
  final String totalResults;
  final String totalPages;

  const CharacterSearchResult({
    Key key,
    this.totalResults,
    this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: DescriptionText(
              label: 'Found: $totalResults results',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: DescriptionText(
              label: 'Pages: $totalPages',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
