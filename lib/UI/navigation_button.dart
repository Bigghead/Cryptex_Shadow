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
        duration: const Duration(milliseconds: 1000), vsync: this
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

  Widget news() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.new_releases),
      ),
    );
  }

  Widget mainToggle() {
    return Container(
      child: FloatingActionButton(
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
            child: news(),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translate.value,
              0.0,
            ),
            child: news(),
          ),
          mainToggle()
        ],
      );
    }
}