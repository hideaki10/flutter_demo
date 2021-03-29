import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<TweenAnimationBuilderExample> {
  double _height = 300;

  double _top = 0;
  int _a = 12;
  @override
  Widget build(BuildContext context) {
    print(_top);
    return Scaffold(
      appBar: AppBar(),
      body: TweenAnimationBuilder(
        //between
        // 不写begin 默认end一样打
        // tween 在2针之间移动

        tween: Tween<double>(end: _top),

        duration: Duration(seconds: 2),
        //
        builder: (context, value, child) {
          return Container(
            width: 300,
            height: _height,
            color: Colors.red[200],
            child: Center(
              // transform.scale 缩放
              // transform.rotate 旋转  3.14
              // transform.translate 平移
              child: Transform.translate(
                //
                offset: Offset(value, value),
                child: Text(
                  "hello",
                  style: TextStyle(fontSize: 100),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // _top = 3.14 / _a--;

            // if (_a < 4) _a = 12;
            // // _top += 120;
            // // if (_top > 120) _top = 0;
            _top++;
          });
        },
      ),
    );
  }
}
