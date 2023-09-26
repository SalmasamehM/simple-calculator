import 'package:calculator/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  var userInput = '';
  var answer = '';

  final myTextStyle = TextStyle(fontSize: 30, color: Colors.deepPurple[900]);

  final List<String> buttons = [
    'C',
    '%',
    '/',
    'X',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '+/-',
    '0',
    '.',
    'Del',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     //stops: [0.1, 0.5, 0.7],
      //     colors: [
      //       Color(0xFF464A4B), //top
      //       //Color(0xFF51555F),
      //       Color(0xFF222629), //bottom
      //     ],
      //   ),
      // ),
      child: Scaffold(
        // backgroundColor: Color(0xFF1E2225),
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFF374352),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 65, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFF8B9695)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      //Clear Button
                      if (index == 0) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              userInput = '';
                              answer = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Color(0xFFFAB82B),
                          textColor: Colors.white,
                        );
                      }

                      //Delete Button
                      else if (index == 18) {
                        return ClipRRect(
                          child: Buttons(
                            buttonTapped: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                                answer = '';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          ),
                        );
                      }

                      //Equal Button
                      else if (index == buttons.length - 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              equalbutton();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                        );
                      }

                      //Rest of the buttons
                      else {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == 'X' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '/' ||
        x == '+/-') {
      return true;
    }
    return false;
  }

  void equalbutton() {
    String finalQuestion = userInput;
    finalQuestion = finalQuestion.replaceAll('X', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
