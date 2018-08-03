import 'package:flutter/material.dart';

import '../UI/gradient_nav.dart';
import '../UI/gradient_body.dart';
import '../UI/currency_card.dart';
import '../UI/currency_image.dart';

class CurrencyInfo extends StatelessWidget {

  final Map currency;
  final int index;

  CurrencyInfo( { @required this.currency, @required this.index } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Column(
          children: <Widget>[
            GradientNav( title: 'Cryptex'),
            GradientBody(
              child: Container(
                constraints: BoxConstraints.expand(),
                  child: Column(
                    children: <Widget>[
                      CurrencyImage(currency['id'], currency['symbol']),
                      CurrencyCard(currency, index)
                    ],
                  ),
              ),
            )
          ],
        ),
      );
    }
}