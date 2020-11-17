import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double horizontalPadding;

  const CustomDivider({
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Divider(
        thickness: 0.35,
        color: Colors.black,
      ),
    );
  }
}
