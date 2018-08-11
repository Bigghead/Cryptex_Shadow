import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {

  final Map _news;

  NewsCard(this._news);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
             Text('${_news['published_on'].toString()}'),
             Row(
               children: <Widget>[
                 Flexible(
                   flex: 3,
                   child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(_news['title']),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(_news['body'], overflow: TextOverflow.ellipsis, maxLines: 7,),
                      )
                    ],
                  ),
                 ),
                 Flexible(
                    flex: 2,
                     child: Padding(
                       padding: EdgeInsets.all(20.0),
                       child: Image(image: NetworkImage(_news['imageurl'])),
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