import 'package:flutter/material.dart';

import 'animated_counter.dart';

class CountAnimate extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<CountAnimate> {
  int _count = 0;

  void increament() {
    _count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.red[200],
          child: AnimateCounter(
            value: _count,
            duration: Duration(seconds: 1),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            increament();
          });
        },
      ),
    );
  }
}
