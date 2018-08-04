import 'package:flutter/material.dart';

class Converter extends StatefulWidget {

  final Map currency;

  Converter( this.currency );

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ConverterState();
    }
}

class _ConverterState extends State<Converter> {

  final GlobalKey _converterForm = GlobalKey<FormState>();
  Map _currency;
  var _coinValue   = new TextEditingController();
  var _dollarValue = new TextEditingController();

  @override
    void initState() {
      _currency = widget.currency;
      super.initState();
    }

  void _updateValue( String price, String value, TextEditingController controller ) {
    setState(() {
      double currentVal      = double.parse(_currency[price]);
             controller.text = controller == _dollarValue 
                ? (double.parse(value) * currentVal).toStringAsFixed(0)
                : (double.parse(value) / currentVal).toStringAsFixed(2);
    });
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
                controller: _coinValue,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  labelText: _currency['symbol'],
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){},
                  )
                ),
                onChanged: ( String value ) {
                  _updateValue('price_usd', value, _dollarValue);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _dollarValue,
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  labelText: 'USD',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear,),
                    onPressed: (){},
                  )
                ),
                onChanged: ( String value ) {
                  _updateValue('price_usd', value, _coinValue);
                },
              )
            ],
          ),
        ),
      );
    }
}