import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/containers/box_decoration.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/shared/containers/character_image.dart';
import 'package:rick_and_morty/shared/list_view/character_card_text.dart';

class CharacterCard extends StatelessWidget {
  final Function onTap;
  final CharacterModel character;

  const CharacterCard({
    @required this.onTap,
    @required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: boxDecoration,
        height: 180,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: _buildRowChildren(),
        ),
      ),
    );
  }

  _buildRowChildren() {
    return [
      CharacterImage(imagePath: character.image),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterCardText(
              label: character.name,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 7),
            CharacterCardText(
              label: 'Specie: ${character.species}',
              fontSize: 18,
            ),
            CharacterCardText(
              label: 'Status: ${character.status}',
              fontSize: 18,
            ),
            CharacterCardText(
              label: 'Location: ${character.location.name}',
              fontSize: 18,
            ),
          ],
        ),
      ),
    ];
  }
}
