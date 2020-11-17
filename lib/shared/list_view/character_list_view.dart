import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/containers/centered_message.dart';

class CharacterListView extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  const CharacterListView({
    Key key,
    this.itemBuilder,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return CenteredMessage(
        message: 'Empty!',
      );
    }
    return Expanded(
      child: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    );
  }
}
