// ignore_for_file: avoid_unnecessary_containers, unused_local_variable
import 'package:calculator/components/buttons.dart';
import 'package:calculator/components/const.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //S TO HOLD Q&A
  var userQuestion = '';
  var userAnswer = '';

  //KEYPAD
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userQuestion,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
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
                    // CLEAR BUTTON
                    if (index == 0) {
                      return MyButtons(
                        color: Colors.red[700],
                        textColor: Colors.black,
                        buttonText: buttons[index],
                        buttonPressed: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                      );
                    } else if (index == 1) {
                      // DELETE BUTTON
                      return MyButtons(
                        color: Colors.blue[700],
                        textColor: Colors.black,
                        buttonText: buttons[index],
                        buttonPressed: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                      );
                    }
                    //EQUAL BUTTON
                    else if (index == buttons.length - 1) {
                      return MyButtons(
                        color: isOperators(buttons[index])
                            ? Colors.black
                            : Colors.yellow[700],
                        textColor: isOperators(buttons[index])
                            ? Colors.white
                            : Colors.black,
                        buttonText: buttons[index],
                        buttonPressed: () {
                          setState(() {
                            evaluation();
                          });
                        },
                      );
                    } else {
                      // OTHER BUTTONS
                      return MyButtons(
                        color: isOperators(buttons[index])
                            ? Colors.black
                            : Colors.yellow[700],
                        textColor: isOperators(buttons[index])
                            ? Colors.white
                            : Colors.black,
                        buttonText: buttons[index],
                        buttonPressed: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
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

  // EQUAL ASSIGNMENT
  void evaluation() {
    String finalQuestion = userQuestion;

    //CONVERTING X TO * FOR MULTIPLICATION PURPOSE
    finalQuestion = finalQuestion.replaceAll('x', '*');

    //PACKAGES FROM PUB DEV
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    //CONVERTING FINAL RESULT TO STRING
    userAnswer = eval.toString();
  }
}
