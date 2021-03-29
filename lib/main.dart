import 'package:flutter/material.dart';
import '01_animate/02/animate_switch.dart';
import '01_animate/03/animate_curves.dart';
import '01_animate/04/tween_animation_builder.dart';
import '01_animate/05/count_animate.dart';
import '07_buildcontext/build_contex.dart';
import 'exercise/06/exercise.dart';

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
      home: CountAnimate(),
    );
  }
}
