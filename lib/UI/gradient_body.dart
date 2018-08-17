import 'package:flutter/material.dart';

import '../UI/gradient_container.dart';


class GradientBody extends StatelessWidget {

  final child;

  GradientBody( { @required this.child } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Expanded(
        child: Container(
          decoration: gradientContainer,
          child: child
        )
      );
    }
}
