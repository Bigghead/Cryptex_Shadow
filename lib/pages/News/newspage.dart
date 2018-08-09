import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../UI/gradient_nav.dart';
import '../../UI/gradient_body.dart';
import '../../UI/navigation_button.dart';

class NewsPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _NewsPageState();
    }
}

class _NewsPageState extends State<NewsPage>{

  List<dynamic> newsResults;

  @override
  initState(){
    _fetchNews();
    super.initState();
  }


  Future<Null> _fetchNews() async {
    http.Response response = await http.get('https://min-api.cryptocompare.com/data/news/?categories=all');
    List<dynamic> data = await json.decode(response.body);
    print(data);
  }


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