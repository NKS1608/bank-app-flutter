import 'package:flutter/material.dart';
import 'screens/MainScreen.dart';

void main() {
  runApp(BankAccount());
}

class BankAccount extends StatefulWidget {
  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anarco Bank'),
        ),
        body: MainScreen(),
      ),
    );
  }
}
