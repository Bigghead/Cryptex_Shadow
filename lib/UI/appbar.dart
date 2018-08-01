import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Cryptex')
            ],
          ),
        ),
      );
    }
}