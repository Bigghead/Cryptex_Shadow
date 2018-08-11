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
             Text('${_news['published_on'].toString()}'),
             Row(
               children: <Widget>[
                 Flexible(
                   child: Column(
                    children: <Widget>[
                      Text(_news['title']),
                      Text(_news['body'], overflow: TextOverflow.ellipsis, maxLines: 5,)
                    ],
                  ),
                 ),
                 Flexible(
                   child: Center(
                     child: Padding(
                       padding: EdgeInsets.all(40.0),
                       child: Image(image: NetworkImage(_news['imageurl'])),
                     ),
                   ),
                 )
               ],
             )
           ]
          ),
        ),
      );
    }
}