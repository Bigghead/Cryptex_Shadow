import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        width: MediaQuery.of(context).size.width * .6,
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Card(
          child: Column(
            children: <Widget>[
              Text('Meep'),
              Text('Meep'),
              Text('Meep'),
              Text('Meep'),
              Text('Meep'),
              Text('Meep'),
              
            ],
          ),
        ),
      );
    }
}