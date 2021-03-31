import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.grey.shade800,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'NullBank S/A',
            style: TextStyle(
              fontFamily: 'Bahnschrift',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(
            Icons.account_balance_outlined,
            size: 32,
          ),
        ),
        body: MainScreen(),
      ),
    );
  }
}
