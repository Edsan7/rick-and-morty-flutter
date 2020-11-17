import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final IconData icon;
  final String message;

  const CenteredMessage({
    this.icon = Icons.warning,
    this.message = 'An error has been ocurred',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).primaryColorDark, size: 40),
          const SizedBox(height: 10),
          Text(message, style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
