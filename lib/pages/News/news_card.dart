import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {

  final Map _news;

  NewsCard(this._news);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Column(
            children: <Widget>[
             Text('${_news['published_on'].toString()}')
           ]
          ),
        ),
      );
    }
}