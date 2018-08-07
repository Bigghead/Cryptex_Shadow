import 'package:flutter/material.dart';

import '../../UI/info_text.dart';

class PriceChart extends StatelessWidget {

  final String dataLength;

  PriceChart( { @required this.dataLength } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Column(
          children: <Widget>[
            Center(child: InfoText(title:dataLength.toUpperCase())),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Image(
                image: NetworkImage('https://cryptohistory.org/charts/light/BTC-usd/${dataLength}/png'),
              ),
            )
          ],
        ),
      );
    }
}