import 'package:flutter/material.dart';

class TestAnimateWidget extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<TestAnimateWidget> {
  double _height = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //全自动的动画 已经封装好 只需要设置Duration
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _height += 100;
            if (_height > 500) _height = 200;
          });
        },
      ),
    );
  }
}
