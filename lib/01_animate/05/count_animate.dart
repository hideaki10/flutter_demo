import 'package:flutter/material.dart';

class CountAnimate extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<CountAnimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.red[200],
          child: TweenAnimationBuilder(
            builder: (BuildContext context, dynamic value, Widget child) {
              print(value);
              final whole = value ~/ 1;
              final decimal = value - whole;
              return Stack(
                children: [
                  Positioned(
                    top: -100 * decimal, // 0 -> -100
                    child: Opacity(
                      opacity: 1 - decimal, // 1 -> 0
                      child: Text(
                        '$whole',
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100 - (100 * decimal), // 100  -> 0
                    child: Opacity(
                      opacity: decimal, // 0 -> 1
                      child: Text(
                        '${whole + 1}',
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
                ],
              );
            },
            duration: Duration(seconds: 1),
            tween: Tween(begin: 7.0, end: 10.0),
          ),
        ),
      ),
    );
  }
}
