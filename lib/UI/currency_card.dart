import 'package:flutter/material.dart';

import '../UI/price_change_text.dart';

class CurrencyCard extends StatelessWidget {

  final Map currency;
  final int index;

  CurrencyCard( this.currency, this.index );

  @override
    Widget build(BuildContext context) {
  
      final bool horizontal = MediaQuery.of(context).orientation == Orientation.landscape;
      
      // TODO: implement build
      return Container(
        width: MediaQuery.of(context).size.width * .6,
        padding: EdgeInsets.all(5.0),
        // margin: new EdgeInsets.fromLTRB(horizontal ? 49.0 : 16.0, horizontal ? 15.0 : 45.0, 15.0, 16.0),
        // constraints: new BoxConstraints.expand(),
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        decoration: BoxDecoration(
          // color: Colors.grey,
          // borderRadius: BorderRadius.circular(10.0),
          // shape: BoxShape.circle
        ),
        child: Card(
          shape: StadiumBorder(),
          child: Column(
            children: <Widget>[
              Text('${ ( index + 1 ).toString() }. ${currency["name"]} ( ${currency["symbol"]} )',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
              Text('\$ ${ double.parse( currency["price_usd"] ).toStringAsFixed(2) }',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 8.0),
                height: 2.0,
                width: 18.0,
                color: Color(0xFFff6a00)
              ),
              PriceChangeText( 
                time: '1 hr:', price: double.parse(currency["percent_change_1h"])
              ),
              Text('Meep'),
              Text('Meep'),
              Text('Meep'),
              
            ],
          ),
        ),
      );
    }
}