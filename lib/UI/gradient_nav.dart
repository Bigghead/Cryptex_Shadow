import 'package:flutter/material.dart';
import './info_text.dart';


class GradientNav extends StatelessWidget {

  final String title;
  final double barHeight;

  GradientNav( { this.title = '', this.barHeight = 50.0 } );

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: InfoText(title: title, fontSize:40.0, fontWeight: FontWeight.bold, ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
                  Color(int.parse('#642b73'.substring(1, 7), radix: 16) + 0xFF000000),
                  Color(int.parse('#c6426e'.substring(1, 7), radix: 16) + 0xFF000000)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),
    );
  }
}