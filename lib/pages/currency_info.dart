import 'package:flutter/material.dart';

class CurrencyInfo extends StatelessWidget {

  final String symbol;

  CurrencyInfo( { @required this.symbol } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Text(symbol);
    }
}