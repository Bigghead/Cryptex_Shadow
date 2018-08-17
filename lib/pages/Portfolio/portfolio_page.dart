import 'package:flutter/material.dart';

import '../../UI/gradient_container.dart';

class PortfolioPage extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: ClipPath(
          child: Container(
            decoration: gradientContainer,
            height: 200.0,
            // color: Colors.red,
          ),
          clipper: new ArcClipper(),
        ),
      );
    }
}


// === Got from https://github.com/huextrat/CryptoShadow/blob/master/lib/ui/portfolio/portfolio_header.dart === //
// === Don't know how this works, tbh, but it looks pretty cool :) === //
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 15);

    var firstControlPoint = new Offset(size.width / 4, size.height);
    var firstPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstPoint.dx, firstPoint.dy);
    var secondControlPoint =new Offset(size.width - (size.width / 4), size.height);
    var secondPoint = new Offset(size.width, size.height - 15);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondPoint.dx, secondPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}