import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';


class NewsCard extends StatelessWidget {

  final Map _news;

  NewsCard(this._news);

  void _parseDate( int date ) {
    return timeago.format(DateTime.fromMillisecondsSinceEpoch(date * 1000));
  }

  void _launchURL() async {
    String url = _news['url'];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return GestureDetector(
        onTap: _launchURL,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
               Container(
                 margin: EdgeInsets.symmetric(vertical: 10.0),
                 child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${_parseDate(_news['published_on'])} from'),
                    SizedBox(width: 5.0),
                    Text('${_news['source']}', style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FiraCode'
                    ),)
                  ],
                ),
               ), 
               Row(
                 children: <Widget>[
                   Flexible(
                     flex: 3,
                     child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(_news['title'], style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
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
        ),
      );
    }
}