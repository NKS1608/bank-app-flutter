import 'package:flutter/material.dart';

class Transaction {
  Icon icon;
  String title;
  DateTime date;
  double value;

  Transaction(this.icon, this.title, this.date, this.value);
}
