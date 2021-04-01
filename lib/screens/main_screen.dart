import 'dart:math';

import 'package:bankapp/models/transactions.dart';
import 'package:bankapp/widgets/bank_text.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Transaction> transactions = [];
  var r = Random();
  double ammount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BankText('EXTRATO'),
                BankText(
                  'SALDO: R\$ ${ammount.toStringAsFixed(2).replaceAll('.', ',')}',
                ),
              ],
            ),
          ),
          Container(
            height: 0.3,
            color: Colors.white,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                // String dateSlug =
                //     "${transactions[index].date.day.toString().padLeft(2, '0')}"
                //     "/${transactions[index].date.month.toString().padLeft(2, '0')}"
                //     "/${transactions[index].date.year.toString()}"
                //     " ${transactions[index].date.hour.toString()}"
                //     "h${transactions[index].date.minute.toString()}m";

                return ListTile(
                  leading: (transactions[index].value > 0)
                      ? CircleAvatar(
                          child: Container(
                            child: Image.asset('${transactions[index].icon}'),
                            width: 30,
                          ),
                          backgroundColor: Colors.transparent,
                        )
                      : CircleAvatar(
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.red.shade900,
                            size: 40,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                  title: (transactions[index].value > 0)
                      ? BankText(transactions[index].title)
                      : BankText('OPERAÇÃO NEGADA'),
                  subtitle: BankText('${transactions[index].date}'),
                  trailing: (transactions[index].value > 0)
                      ? BankText(
                          'R\$ ${transactions[index].value.toStringAsFixed(2).replaceAll('.', ',')}',
                        )
                      : BankText('SALDO INSUFICIENTE'),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      double value = r.nextDouble() * 999.99 + 0.01;
                      transactions.add(
                        Transaction(
                          'assets/icons/money-green.png',
                          'DEPÓSITO',
                          Transaction.randomDate(),
                          value,
                        ),
                      );
                      ammount += value;
                    });
                  },
                  child: Container(
                    height: 55,
                    color: Color.fromARGB(255, 0, 255, 127),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.arrow_upward,
                            color: Colors.white, size: 28),
                        backgroundColor: Colors.transparent,
                      ),
                      title: BankText(
                        'DEPOSITAR',
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      double value = r.nextDouble() * 999.99 + 0.01;

                      if (ammount - value <= 0) {
                        value = ammount;
                      } else if (value == 0) {
                        value = 0.0;
                      }

                      transactions.add(
                        Transaction(
                          'assets/icons/money-red.png',
                          'SAQUE',
                          Transaction.randomDate(),
                          value,
                        ),
                      );
                      ammount -= value;
                    });
                  },
                  child: Container(
                    height: 55,
                    color: Color.fromARGB(255, 253, 57, 9),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                          size: 28,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      title: BankText(
                        'SACAR',
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
