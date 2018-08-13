import 'package:flutter/material.dart';

import '../../UI/info_text.dart';

class PriceChart extends StatelessWidget {

  final String symbol;
  final String dataLength;

  PriceChart( { @required this.symbol, @required this.dataLength } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.show_chart, color: Colors.white,),
                InfoText(title:dataLength.toUpperCase())
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://cryptohistory.org/charts/light/${symbol}-usd/${dataLength}/png'),
              ),
            )
          ],
        ),
      );
    }
}