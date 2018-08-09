import 'package:flutter/material.dart';

import '../../UI/gradient_nav.dart';
import '../../UI/gradient_body.dart';
import '../../UI/navigation_button.dart';

class NewsPage extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Column(
          children: <Widget>[
            GradientNav(),
            GradientBody(
              child: Center(child: Text('meep'),),
            )
          ],
        ),
        floatingActionButton: NavButton(),
      );
    }
}