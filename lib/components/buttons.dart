// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:calculator/components/const.dart';
import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonPressed;
  const MyButtons({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPressed,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
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
      ),
    );
  }
}
