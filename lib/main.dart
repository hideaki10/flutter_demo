import 'package:flutter/material.dart';
import 'package:flutter_page/temp/temp.dart';
import '01_animate/02/animate_switch.dart';
import '01_animate/03/animate_curves.dart';
import '01_animate/04/tween_animation_builder.dart';
import '01_animate/05/count_animate.dart';
import '01_animate/06/show_animated.dart';
import '01_animate/07/animated_controller.dart';
import '01_animate/08/animated_tween.dart';
import '01_animate/09/curve_tween.dart';
import '03_async/03/stream_builder.dart';
import '03_async/04/tape_game.dart';
import '07_buildcontext/build_contex.dart';
import 'exercise/06/exercise.dart';
import 'exercise/08/exercise.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TypeGame(),
    );
  }
}
