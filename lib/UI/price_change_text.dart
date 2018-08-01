import 'package:flutter/material.dart';

class PriceChangeText extends StatelessWidget {

  final String time;
  final double price;

  PriceChangeText( { @required this.time, @required this.price } );

  @override
    Widget build(BuildContext context) {
      final String caret = price < 0 ? '\u25BC' : '\u25B2';
      // TODO: implement build
      return Text('${time}: ${caret} ${price.toString()}',
        style: TextStyle(
          color: price < 0 ? Colors.red : Colors.green
        ),
      );
    }
}