import 'package:flutter/material.dart';

class PageNavigateButton extends StatelessWidget {
  final Icon icon;
  final Function goToPage;

  const PageNavigateButton({
    Key key,
    this.icon,
    this.goToPage,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: goToPage,
    );
  }
}
