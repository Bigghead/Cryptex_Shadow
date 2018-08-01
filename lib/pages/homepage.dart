import 'package:flutter/material.dart';
import '../UI/gradient_background.dart';


class HomePage extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      return _HomeState();
    }

}

class _HomeState extends State<HomePage> {

  final List<Map> currencies = [];

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