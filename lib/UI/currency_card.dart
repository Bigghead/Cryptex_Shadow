import 'package:flutter/material.dart';

import '../UI/price_change_text.dart';

class CurrencyCard extends StatelessWidget {

  final Map currency;
  final int index;

  CurrencyCard( this.currency, this.index );

  @override
    Widget build(BuildContext context) {
  
      final bool horizontal = MediaQuery.of(context).orientation == Orientation.landscape;
      
      return Container(
        width: MediaQuery.of(context).size.width * .7,
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
        ),
        child: Card(
          shape: StadiumBorder(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PriceChangeText( 
                    time: '1 hr:', price: double.parse(currency["percent_change_1h"])
                  )   ,
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),),
                  PriceChangeText( 
                    time: '24 hr:', price: double.parse(currency["percent_change_24h"])
                  ),
                ],
              ),
              PriceChangeText( 
                time: '7d:', price: double.parse(currency["percent_change_7d"])
              ),
              SizedBox(height: 10.0,),
              
            ],
          ),
        ),
      );
    }
}