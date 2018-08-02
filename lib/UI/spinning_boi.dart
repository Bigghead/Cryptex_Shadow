import 'package:flutter/material.dart';

class SpinningBoi extends StatelessWidget {

  final double width;
  final double height;

  SpinningBoi( { @required this.width, @required this.height } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Center(
          child: Container(
            // color: Colors.grey,
            width: width,
            height: height,
            child: Center(
              child: CircularProgressIndicator(
                value: null,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
    }
}