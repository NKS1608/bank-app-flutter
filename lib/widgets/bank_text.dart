import 'package:flutter/material.dart';

class BankText extends StatelessWidget {
  final String text;
  final double size;

  BankText(this.text, {this.size = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Futura',
      ),
    );
  }
}
