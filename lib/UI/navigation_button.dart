import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _NavButtonState();
    }
}

class _NavButtonState extends State<NavButton> with TickerProviderStateMixin {

  bool isOpened = false;
  Animation<double> _animation;
  Animation<double> _translate;
  AnimationController _controller;

  @override
    void initState() {
      // TODO: implement initState

      _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this
      )..addListener(() {
            setState(() {});
      });

      _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
      _translate = Tween<double>(
        begin: 55.0,
        end: -14.0,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.75,
          curve: Curves.easeOut,
        ),
      ));
      super.initState();
      
    }
  
  animate() {
    if (!isOpened) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isOpened = !isOpened;
  }

  @override
    void dispose() {
      // TODO: implement dispose
      _controller.dispose();
      super.dispose();
    }

  Widget home() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'Home',
        backgroundColor: Colors.blue,
        onPressed: () { Navigator.pushNamed(context, '/'); },
        tooltip: 'Home',
        child: Icon(Icons.home),
      ),
    );
  }

  Widget news() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'News',
        backgroundColor: Colors.blue,
        onPressed: () { Navigator.pushNamed(context, '/news'); },
        tooltip: 'News',
        child: Icon(Icons.chrome_reader_mode),
      ),
    );
  }

    Widget portfolio() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'Portfolio',
        backgroundColor: Colors.blue,
        onPressed: () { Navigator.pushNamed(context, '/portfolio'); },
        tooltip: 'Portfolio',
        child: Icon(Icons.pie_chart_outlined),
      ),
    );
  }

  Widget mainToggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'MainToggle',
        backgroundColor: Colors.blue,
        onPressed: animate,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animation
        ),
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translate.value * 2.0,
              0.0,
            ),
            child: home(),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translate.value,
              0.0,
            ),
            child: news(),
          ),
          // Transform(
          //   transform: Matrix4.translationValues(
          //     0.0,
          //     _translate.value,
          //     0.0,
          //   ),
          //   child: portfolio(),
          // ),
          mainToggle()
        ],
      );
    }
}