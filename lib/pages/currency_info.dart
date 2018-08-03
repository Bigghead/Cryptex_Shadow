import 'package:flutter/material.dart';

import '../UI/gradient_nav.dart';

class CurrencyInfo extends StatelessWidget {

  final String symbol;

  CurrencyInfo( { @required this.symbol } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Column(
          children: <Widget>[
            GradientBackground(),
            Expanded(
              child: Center(
                child: Text(symbol),
              ),
            )
          ],
        ),
      );
    }
}