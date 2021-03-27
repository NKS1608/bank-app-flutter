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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.grey.shade800,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anarco Bank'),
        ),
        body: MainScreen(),
      ),
    );
  }
}
