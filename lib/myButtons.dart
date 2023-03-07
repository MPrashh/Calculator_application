import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  Color color = Colors.red;
  Color textColor = Colors.green;
  final buttonText;
  final buttontapped;
  //Contructor
  MyButton(
      {required this.color,
      required this.textColor,
      required this.buttonText,
      this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        buttontapped();
      },
      child: Text(
        buttonText,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 30,
          color: textColor,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
    );
  }
}
