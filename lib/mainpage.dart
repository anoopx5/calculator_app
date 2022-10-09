import 'package:calculator_app/calbtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var question = '';
  var answer = '';

  final List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '÷',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '00',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 236, 236),
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
                        question,
                        style: GoogleFonts.rubik(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child:
                          Text(answer, style: GoogleFonts.rubik(fontSize: 20)),
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
                      if (index == 0) {
                        return CalcButton(
                          tapedbuttn: () {
                            setState(() {
                              question = '';
                            });
                          },
                          textButton: buttons[index],
                          color: Colors.red,
                          colorText: Colors.black87,
                        );
                      } else if (index == 1) {
                        return CalcButton(
                          tapedbuttn: () {
                            setState(() {
                              question =
                                  question.substring(0, question.length - 1);
                            });
                          },
                          textButton: buttons[index],
                          color: Colors.green,
                          colorText: Colors.black87,
                        );
                      } else if (index == buttons.length - 1) {
                        return CalcButton(
                          tapedbuttn: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          textButton: buttons[index],
                          color: Colors.blue,
                          colorText: Colors.black87,
                        );
                      } else {
                        return CalcButton(
                          tapedbuttn: () {
                            setState(() {
                              question += buttons[index];
                            });
                          },
                          textButton: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blue
                              : Color.fromARGB(255, 183, 205, 223),
                          colorText: isOperator(buttons[index])
                              ? Colors.black87
                              : Colors.black87,
                        );
                      }
                    }),
              ),
            ),
          ],
        ));
  }

  bool isOperator(String X) {
    if (X == '%' || X == '÷' || X == 'x' || X == '-' || X == '+' || X == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = question;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
