import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final Color color;

  MessagesPage(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}