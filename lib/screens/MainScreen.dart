import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
                    'SALDO: R\$ 0,00',
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 65,
                  color: Colors.yellow[800],
                ),
              ),
              Expanded(
                child: Container(
                  height: 65,
                  color: Colors.yellow[800],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
