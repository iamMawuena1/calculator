// ignore_for_file: avoid_unnecessary_containers

import 'package:calculator/components/buttons.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List buttons = [
    'CLR',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButtons(
                      color: Colors.red[700],
                      textColor: Colors.black,
                      buttonText: buttons[index],
                    );
                  } else if (index == 1) {
                    return MyButtons(
                      color: Colors.blue[700],
                      textColor: Colors.black,
                      buttonText: buttons[index],
                    );
                  } else {
                    return MyButtons(
                      color: isOperators(buttons[index])
                          ? Colors.black
                          : Colors.yellow[700],
                      textColor: isOperators(buttons[index])
                          ? Colors.white
                          : Colors.black,
                      buttonText: buttons[index],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  //OPERATOR COLOR SELECTOR
  bool isOperators(String k) {
    if (k == '%' || k == '/' || k == 'x' || k == '-' || k == '+' || k == '=') {
      return true;
    }
    return false;
  }
}
