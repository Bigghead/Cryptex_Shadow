import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import './currency_converter.dart';

import '../../UI/gradient_nav.dart';
import '../../UI/gradient_body.dart';
import '../../UI/currency_card.dart';
import '../../UI/currency_image.dart';
import '../../UI/info_text.dart';

class CurrencyInfo extends StatelessWidget {

  final Map currency;
  final int index;
  final formatCurrency = NumberFormat("#,##0.00", "en_US");


  CurrencyInfo( { @required this.currency, @required this.index } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: GestureDetector(
          onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); },
          child: Column(
            children: <Widget>[
              GradientNav( title: 'Cryptex'),
              GradientBody(
                child: Container(
                  constraints: BoxConstraints.expand(),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        CurrencyImage(currency['id'], currency['symbol']),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          child: CurrencyCard(currency, index),
                        ),
                        SizedBox(height: 10.0,),

                        Center( child:InfoText(
                          title: 'Market Cap', fontSize: 24.0,)
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(vertical: 8.0),
                          height: 2.0,
                          width: MediaQuery.of(context).size.width * .90,
                          color: Colors.grey
                        ),
                        Center( child: InfoText(
                          title: '\$${formatCurrency.format(double.parse(currency["market_cap_usd"]))}',
                        ) ),
                        SizedBox(height: 20.0,),
                        Converter(currency)
                      ],
                    ),
                ),
              )
            ],
          ),
        ),
      );
    }
}