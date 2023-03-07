import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import './myButtons.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';
  final List<String> buttons = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '=',
    '0',
    'C',
    '+',
    'AC',
    '.',
    '^',
    '%'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerRight,
        color: Colors.grey[50],
        child: Text(
          userInput,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerRight,
        color: Colors.grey[50],
        child: Text(
          answer,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 40),
        ),
      ),
      Container(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: buttons.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          // mainAxisSpacing: 20,
          // ignore: prefer_const_literals_to_create_immutables
          // padding: EdgeInsets.all(30),
          itemBuilder: (BuildContext context, int index) {
            if (index == 3 ||
                index == 7 ||
                index == 11 ||
                index == 15 ||
                index == 19 ||
                index == 18) {
              return MyButton(
                buttontapped: () {
                  setState(() {
                    if (userInput[userInput.length - 1] == "+" ||
                        userInput[userInput.length - 1] == "-" ||
                        userInput[userInput.length - 1] == "/" ||
                        userInput[userInput.length - 1] == "%" ||
                        userInput[userInput.length - 1] == "*" ||
                        userInput[userInput.length - 1] == "^") {
                      userInput = userInput.substring(0, userInput.length - 1);
                      userInput += buttons[index];
                    } else {
                      userInput += buttons[index];
                    }
                  });
                },
                buttonText: buttons[index],
                color: Colors.blue,
                textColor: Colors.white,
              );
            } else if (index == 12) {
              return MyButton(
                buttontapped: () {
                  setState(() {
                    answer = result();
                  });
                },
                buttonText: buttons[index],
                color: Colors.orange,
                textColor: Colors.white,
              );
            } else if (index == 16) {
              return MyButton(
                buttontapped: () {
                  setState(() {
                    userInput = '';
                    answer = '';
                  });
                },
                buttonText: buttons[index],
                color: Colors.orange,
                textColor: Colors.white,
              );
            } else if (index == 14) {
              return MyButton(
                buttontapped: () {
                  setState(() {
                    userInput = userInput.substring(0, userInput.length - 1);
                  });
                },
                buttonText: buttons[index],
                color: Colors.orange,
                textColor: Colors.white,
              );
            } else {
              return MyButton(
                buttontapped: () {
                  setState(() {
                    userInput += buttons[index];
                  });
                },
                buttonText: buttons[index],
                color: Colors.blue.shade50,
                textColor: Colors.black,
              );
            }
          },
        ),
      ),
    ]);
  }

  result() {
    if (userInput[0] == "+" ||
        userInput[0] == "*" ||
        userInput[0] == "/" ||
        userInput[0] == "%" ||
        userInput[0] == "^" ||
        userInput[userInput.length - 1] == "+" ||
        userInput[userInput.length - 1] == "-" ||
        userInput[userInput.length - 1] == "/" ||
        userInput[userInput.length - 1] == "%" ||
        userInput[userInput.length - 1] == "*" ||
        userInput[userInput.length - 1] == "^") {
      userInput = "Invalid Expression";
      answer = "";
    } else {
      String finaluserinput = userInput;
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
    }
    return answer;
  }
}
