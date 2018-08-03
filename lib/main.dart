import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/homepage.dart';
import './pages/currency_info.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      routes: {
        '/': ( BuildContext context ) => HomePage(),
      },
    );
  }
}

