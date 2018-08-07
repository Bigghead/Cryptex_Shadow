import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import './currency_converter.dart';

import '../../UI/gradient_nav.dart';
import '../../UI/gradient_body.dart';
import '../../UI/currency_card.dart';
import '../../UI/currency_image.dart';
import '../../UI/info_text.dart';

class CurrencyInfo extends StatefulWidget {

  final Map currency;
  final int index;
  final formatCurrency = NumberFormat("#,##0.00", "en_US");

   CurrencyInfo( { @required this.currency, @required this.index } );
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CurrencyInfoState();
  }

}

class _CurrencyInfoState extends State<CurrencyInfo> {

  Map _currency;
  int _index;
  Map _priceData;
  var _formatCurrency = NumberFormat("#,##0.00", "en_US");

  @override
  initState() {
    _currency       = widget.currency;
    _index          = widget.index;
    _formatCurrency = widget.formatCurrency;
    _getPriceData();
    super.initState();
  }

  
  Future<Null> _getPriceData() async {
    
    try {
      
      final http.Response response = await http.get('https://min-api.cryptocompare.com/data/histoday?fsym=${_currency["symbol"]}&tsym=USD&limit=6',
                                                    headers: { 'accept' : 'application/json' } );
      final Map data               = await json.decode(response.body);
      print(data);

    } catch( e ) {
      print(e);
    }
  }

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
                        CurrencyImage(_currency['id'], _currency['symbol']),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          child: CurrencyCard(_currency, _index),
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
                          title: '\$${_formatCurrency.format(double.parse(_currency["market_cap_usd"]))}',
                        ) ),
                        SizedBox(height: 20.0,),
                        Converter(_currency)
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