import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme_app.dart';
import 'package:rick_and_morty/pages/characters_page/characters_page.dart';
import 'core/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kTitleApp,
      theme: themeApp,
      home: CharactersPage(),
    );
  }
}