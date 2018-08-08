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
  AnimationController _controller;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this
      );

      _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
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
    Widget build(BuildContext context) {
      // TODO: implement build
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: animate,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animation
        ),
      );
    }
}