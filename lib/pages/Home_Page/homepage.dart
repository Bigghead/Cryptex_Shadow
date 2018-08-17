import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Currency_Info/currency_info.dart';
import '../../UI/Gradient/gradient_nav.dart';
import '../../UI/Gradient/gradient_body.dart';
import '../../UI/Currency/currency_card.dart';
import '../../UI/Currency/currency_image.dart';
import '../../UI/navigation_button.dart';
import './spinning_boi.dart';

// import '../../utils/currencyData.dart';


class HomePage extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      return _HomeState();
    }

}

class _HomeState extends State<HomePage> {

  List<dynamic> _currencies = [];

    @override
    void initState() {
      super.initState();
      _fetchData();
      // var currencyData = CurrencyData();
      // _currencies = currencyData.currencies;
    }


  Future<Null> _fetchData() async {
    final response        = await http.get('https://api.coinmarketcap.com/v1/ticker/?limit=20', 
                                  headers: { 'accept' : 'application/json' } );
    final List<dynamic> coinData = await json.decode(response.body);
    // print(coinData);
    setState( () => _currencies = coinData );
  }


  Widget _buildCurrencyList( BuildContext context ) {

    return GradientBody(
        child: _currencies.length == 0 
            ? SpinningBoi(width: 160.0, height: 100.0,)
            : ListView.builder(
                itemCount: _currencies.length,
                itemBuilder: ( BuildContext context, int index ) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: ( BuildContext context ) => CurrencyInfo( currency: _currencies[index], index: index )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CurrencyImage(
                          _currencies[index]['id'], _currencies[index]['symbol']
                        ),
                        CurrencyCard(_currencies[index], index)
                      ],
                    ),
                  );
                },
              )
      );
  }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Column(
          children: <Widget>[
            GradientNav( title: 'Cryptex' ),
            _buildCurrencyList(context)
          ],
        ),
        floatingActionButton: NavButton(),
      );
    }

}