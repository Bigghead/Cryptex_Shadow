import 'package:flutter/material.dart';

class GradientBody extends StatelessWidget {

  final child;

  GradientBody( { @required this.child } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
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
          child: child
        )
      );
    }
}
