import 'package:flutter/material.dart';

class AnimateCounter extends StatelessWidget {
  final int value;
  final Duration duration;

  const AnimateCounter({Key key, this.value, @required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
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
      duration: duration,
      //tween 关键点
      tween: Tween(end: value.toDouble()),
    );
  }
}
