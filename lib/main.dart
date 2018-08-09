import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/Home_Page/homepage.dart';
import './pages/News/newspage.dart';

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
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      routes: {
        '/'    : ( BuildContext context ) => HomePage(),
        '/news': ( BuildContext context ) => NewsPage(),
      },
    );
  }
}

