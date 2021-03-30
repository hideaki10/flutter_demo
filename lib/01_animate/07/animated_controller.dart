import 'package:flutter/material.dart';

class AnimatedController extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<AnimatedController>
    with SingleTickerProviderStateMixin {
  //显示动画 的 controller
  AnimationController animationController;

  bool _isLoading = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(seconds: 1),
        //自己手写动画
        //显示动画
        //vsync 垂直同步
        //tweenのbegin
        lowerBound: 1.0,

        //tweenのend
        upperBound: 4.0,
        vsync: this);
    animationController.addListener(() {
      print(animationController.value);
    });
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

        child: ScaleTransition(
          scale: animationController,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red[200],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.repeat(reverse: true);
        },
      ),
    );
  }
}
