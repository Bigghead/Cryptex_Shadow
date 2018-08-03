import 'package:flutter/material.dart';

class Converter extends StatefulWidget {

  final String symbol;

  Converter( this.symbol );

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ConverterState();
    }
}

class _ConverterState extends State<Converter> {

  final GlobalKey _converterForm = GlobalKey<FormState>();
  String _symbol;

  @override
    void initState() {
      _symbol = widget.symbol;
      super.initState();
    }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Form(
        key: _converterForm,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  labelText: _symbol,
                  filled: true,
                  fillColor: Colors.white
                ),
                onChanged: ( String value ) {},
              ),
              TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  labelText: 'USD',
                  filled: true,
                  fillColor: Colors.white
                ),
                onChanged: ( String value ) {},
              )
            ],
          ),
        ),
      );
    }
}