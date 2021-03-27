import 'package:flutter/material.dart';

class TestAnimateContainer extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<TestAnimateContainer> {
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
            color: Colors.red,
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [Colors.red, Colors.white],
                end: Alignment.topCenter,
                stops: [0.2, 0.3]),
            //
            boxShadow: [BoxShadow(spreadRadius: 25, blurRadius: 25)],
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Center(
            child: Text(
              "dd",
              style: TextStyle(fontSize: 12),
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
