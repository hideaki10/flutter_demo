import 'package:flutter/material.dart';

class AnimatedTween extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

// snapshot sta
//
class _TestAnimateContainerState extends State<AnimatedTween>
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

        child: SlideTransition(
          position: Tween(begin: Offset(0, -0.5), end: Offset(0, 0.8))
              //curve (Interval 动画必须在0。0～0.5之间完成)
              .chain(CurveTween(curve: Interval(0.8, 1.0)))
              .animate(animationController),
          //tween
          // position: animationController
          //     .drive(Tween(begin: Offset(0, 0), end: Offset(1, 1))),
          //tween
          //scale: animationController.drive(Tween(begin: 0.5, end: 2.0)),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red[200],
          ),
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
