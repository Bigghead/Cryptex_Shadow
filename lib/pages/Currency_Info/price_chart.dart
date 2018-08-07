import 'package:flutter/material.dart';

import '../../UI/info_text.dart';

class PriceChart extends StatelessWidget {

  final String dataLength;

  PriceChart( { @required this.dataLength } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            InfoText(title:dataLength.toUpperCase()),
            SizedBox(height: 15.0,),
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