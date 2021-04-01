import 'dart:math';

class Transaction {
  String icon;
  String title;
  String date;
  double value;

  Transaction(this.icon, this.title, this.date, this.value);

  static String _formatedNumber(int number) {
    return number < 10 ? '0$number' : number.toString();
  }

  static String randomDate() {
    var r = Random();
    String day = _formatedNumber((r.nextDouble() * 27 + 1).toInt());
    String month = _formatedNumber((r.nextDouble() * 11 + 1).toInt());
    int year = 2000 + (r.nextDouble() * 100 + 1).toInt();
    String hour = _formatedNumber(((r.nextDouble() * 22 + 1)).toInt());
    String minute = _formatedNumber(((r.nextDouble() * 58 + 1)).toInt());

    return '$day/$month/$year $hour\h$minute';
  }
}
