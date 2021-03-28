import 'dart:math';

import 'package:bankapp/models/transactions.dart';
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
              children: [
                Expanded(
                  child: Text(
                    'EXTRATO',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Futura',
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'SALDO: R\$ ${ammount.toStringAsFixed(2).replaceAll('.', ',')}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Futura',
                    ),
                  ),
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
                String dateSlug =
                    "${transactions[index].date.day.toString().padLeft(2, '0')}"
                    "/${transactions[index].date.month.toString().padLeft(2, '0')}"
                    "/${transactions[index].date.year.toString()}"
                    " ${transactions[index].date.hour.toString()}"
                    "h${transactions[index].date.minute.toString()}m";

                return ListTile(
                  leading: transactions[index].icon,
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Futura',
                    ),
                  ),
                  subtitle: Text(
                    dateSlug,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Futura',
                    ),
                  ),
                  trailing: (transactions[index].value > 0)
                      ? Text(
                          'R\$${transactions[index].value.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Futura',
                          ),
                        )
                      : Text(
                          'Saldo Insuficiente',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Futura',
                          ),
                        ),
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
                          Icon(Icons.add),
                          'DEPÓSITO',
                          DateTime.now(),
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
                      leading: Icon(Icons.add),
                      title: Text(
                        'DEPOSITAR',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Futura',
                        ),
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
                          Icon(Icons.remove),
                          'SAQUE',
                          DateTime.now(),
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
                      leading: Icon(Icons.remove),
                      title: Text(
                        'SACAR',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Futura',
                        ),
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
