import 'dart:math';

import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = 100, h = 20;

    TextSpan span = TextSpan(
      text: "WSBT",
      style: TextStyle(fontSize: 20),
    );

    final tp = TextPainter(
      textDirection: TextDirection.ltr,
      text: span,
    )..layout();

    w = tp.width * 2;
    h = tp.height;

    return Scaffold(
      // body: testBanner(),
      body: Center(
        child: ClipRect(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.red[200],
              ),
              Positioned(
                right: 0,
                top: sqrt(h * h + w * w / 2 - sqrt(2) * h * w),
                child: Transform.rotate(
                  alignment: Alignment.bottomRight,
                  angle: pi / 4,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red.withOpacity(0.8),
                    child: Text.rich(span),
                    width: w,
                    height: h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class testBanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ClipRect(
//         child: Banner(
//           message: "ss",
//           location: BannerLocation.topEnd,
//           child: Container(
//             width: 200,
//             height: 200,
//             color: Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }
