import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FontApp extends StatefulWidget {
  @override
  _AnimateButtonState createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<FontApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.cyan[400],
            Colors.purple[300],
            Colors.pink[200],
          ],
          stops: [0, 0.5, 1],
          begin: Alignment(-0.5, -0.9),
          end: Alignment(1.5, 0.6),
        )),
        child: ListView(
          children: [
            SizedBox(
              height: 780,
              child: BuildBox(),
            ),
            // SizedBox(
            //   height: 300,
            //   child: Row(
            //     children: [
            //       Expanded(child: _buildBox()),
            //       Expanded(child: _buildBox()),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 220,
            //   child: _buildBox(),
            // ),
          ],
        ),
      ),
    );
  }
}

class BuildBox extends StatelessWidget {
  final watemark = "LGTM";
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: EdgeInsets.all(2),
          child: CupertinoPopupSurface(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
              ),
            ),
            //背景模糊
            // child: ImageFiltered(
            //   imageFilter: ImageFilter.blur(
            //     sigmaX: watemark != null ? 2 : 0,
            //     sigmaY: watemark != null ? 2 : 0,
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(24),
            //     child: FlutterLogo(
            //       style: FlutterLogoStyle.horizontal,
            //     ),
            //   ),
            // ),
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Center(
            child: Container(
              color: Colors.red,
              width: constraints.biggest.shortestSide,
              height: constraints.biggest.shortestSide,
              child: Transform.rotate(
                angle: 0.0,
                child: FittedBox(
                  child: Text(
                    watemark,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

// child: ImageFiltered(
//   imageFilter: ImageFilter.blur(
//     sigmaX: watemark != null ? 2 : 0,
//     sigmaY: watemark != null ? 2 : 0,
//   ),
//   child: Padding(
//     padding: EdgeInsets.all(24),
//     child: FlutterLogo(
//       style: FlutterLogoStyle.horizontal,
//     ),
//   ),
// ),
