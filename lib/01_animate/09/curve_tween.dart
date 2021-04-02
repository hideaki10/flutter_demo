import 'package:flutter/material.dart';

class CurveTweenExample extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

// snapshot sta
//
class _TestAnimateContainerState extends State<CurveTweenExample>
    // 屏幕刷新的时候就会产生1个ticker，60针屏幕 每秒种会产生60次ticker 120帧数就会有120次
    with
        SingleTickerProviderStateMixin {
  //显示动画 的 controller
  AnimationController animationController;

  bool _isLoading = false;

  List<String> st = ["1", "2"];

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(seconds: 3),
        //自己手写动画
        //显示动画
        //vsync 垂直同步 屏幕刷新数据
        //tweenのbegin
        vsync: this)
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //显示动画多以transition结尾
        //RotationTransition
        //FadeTransition

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlidingBox(
              begin: 0.0,
              end: 0.2,
              imationController: animationController,
              color: 50,
            ),
            SlidingBox(
              begin: 0.2,
              end: 0.4,
              imationController: animationController,
              color: 100,
            ),
            SlidingBox(
              begin: 0.4,
              end: 0.6,
              imationController: animationController,
              color: 500,
            ),
            SlidingBox(
              begin: 0.6,
              end: 0.8,
              imationController: animationController,
              color: 700,
            ),
            SlidingBox(
              begin: 0.8,
              end: 1.0,
              imationController: animationController,
              color: 900,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.stop();
        },
      ),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController imationController;
  final int color;
  final double begin;
  final double end;
  const SlidingBox(
      {Key key, this.imationController, this.color, this.begin, this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(begin: Offset.zero, end: Offset(0.1, 0.0))
          .chain(CurveTween(curve: Curves.bounceInOut))
          //curve (Interval 动画必须在0。0～0.5之间完成)
          .chain(CurveTween(curve: Interval(begin, end)))
          .animate(imationController), // controller 控制x的值
      child: Container(
        width: 300,
        height: 100,
        color: Colors.red[color],
      ),
    );
  }
}
