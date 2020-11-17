import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final Color backgroundColor;

  const CircularLoading({
    Key key,
    this.backgroundColor = Colors.white60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
