import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
