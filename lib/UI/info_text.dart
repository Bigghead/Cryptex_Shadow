import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {

  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  InfoText( { @required this.title, this.fontSize = 16.0, this.fontWeight = FontWeight.normal } );

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Text(title, 
                  style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight
                      ),);
    }
} 