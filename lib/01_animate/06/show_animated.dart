import 'package:flutter/material.dart';

class ShowAnimated extends StatefulWidget {
  @override
  _TestAnimateContainerState createState() => _TestAnimateContainerState();
}

class _TestAnimateContainerState extends State<ShowAnimated>
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
        vsync: this);
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
        child: RotationTransition(
          turns: animationController,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red[200],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isLoading) {
            animationController.stop();
          } else {
            animationController.repeat();
          }
          _isLoading = !_isLoading;
        },
      ),
    );
  }
}
