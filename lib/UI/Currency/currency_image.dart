import 'package:flutter/material.dart';

class CurrencyImage extends StatelessWidget {

  final String id;
  final String symbol;

  CurrencyImage( this.id, this.symbol ) ;

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Hero(
        tag: "crypto-hero-${id + symbol}",
        child: FadeInImage(
          placeholder: AssetImage("assets/CryptoShadow_logo.png"),
          image: AssetImage('assets/img/${symbol.toLowerCase()}.png'),
          fadeOutDuration: Duration(milliseconds: 200),
          fadeOutCurve: Curves.decelerate,
          height: 80.0,
          // width: 80.0,
        ),
      );
    }
}