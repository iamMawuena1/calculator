// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  const MyButtons({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
