import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './news_card.dart';
import '../../UI/gradient_nav.dart';
import '../../UI/gradient_body.dart';
import '../../UI/navigation_button.dart';
import '../Home_Page/spinning_boi.dart';

import '../../utils/newsData.dart';

class NewsPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _NewsPageState();
    }
}

class _NewsPageState extends State<NewsPage>{

  List<dynamic> _newsResults = [];

  @override
  initState(){
    // _fetchNews();
    var newsData = NewsData();
    this._newsResults = newsData.news;
    super.initState();
  }


  Future<Null> _fetchNews() async {
    http.Response response = await http.get('https://min-api.cryptocompare.com/data/news/?categories=all');
    List<dynamic> data = await json.decode(response.body);
    setState(() {
          _newsResults = data;
        });
  }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Column(
          children: <Widget>[
            GradientNav(),
            GradientBody(
              child: _newsResults.length == 0 
                ? Center(child: SpinningBoi(width: 160.0, height: 100.0,))
                : ListView.builder(
                  itemCount: _newsResults.length,
                  itemBuilder: ( BuildContext context, int index ) {
                    return NewsCard(_newsResults[index]);
                  },
                )
            )
          ],
        ),
        floatingActionButton: NavButton(),
      );
    }
}