import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../UI/gradient_background.dart';
import '../UI/currency_card.dart';
import '../UI/currency_image.dart';

import '../utils/currencyData.dart';


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
      // _fetchData();
      var currencyData = CurrencyData();
      _currencies = currencyData.currencies;
    }


  Future<Null> _fetchData() async {
    final response        = await http.get('https://api.coinmarketcap.com/v1/ticker/?limit=20');
    final List<dynamic> coinData = await json.decode(response.body);
    // print(coinData);
    setState( () => _currencies = coinData );
    print(_currencies);
  }


  Widget _buildCurrencyList( BuildContext context ) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp
          ),
        ),
        child: 
        // _currencies.length == 0 
        //         ? Center(child: Text('Fetching Data'),)
        //         :
                 ListView.builder(
                  itemCount: _currencies.length,
                  itemBuilder: ( BuildContext context, int index ) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CurrencyImage(
                          _currencies[index]['id'], _currencies[index]['symbol']
                        ),
                        CurrencyCard(_currencies[index], index)
                      ],
                    );
                  },
                )
      ),
      
    );
  }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Column(
          children: <Widget>[
            GradientBackground( title: 'Cryptex' ),
            _buildCurrencyList(context)
          ],
        ),
      );
    }

}