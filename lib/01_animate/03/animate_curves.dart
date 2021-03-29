import 'package:flutter/material.dart';

class TestAnimateCurves extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<TestAnimateCurves> {
  double _height = 300;

  double _top = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedPadding(
        padding: EdgeInsets.only(top: _top),
        //
        curve: Curves.bounceIn,
        //
        duration: Duration(seconds: 2),
        child: AnimatedOpacity(
          opacity: 1.0,
          curve: Curves.linear,
          duration: Duration(seconds: 2),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 300,
            height: _height,
            decoration: BoxDecoration(
              color: Colors.red[200],
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: //CircularProgressIndicator(),
                    Text(
                  "hello",
                  key: ValueKey("Hello"),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _top = 300;
            if (_top == 300) _top = 0;
          });
        },
      ),
    );
  }
}
