import 'package:flutter/material.dart';
import 'package:flutter_page/renderbox/renderbox.dart';
import 'package:flutter_page/banner/banner.dart';

import 'custom_multi_child_layout/cutsom_multi_child_layout.dart';
import 'exercise_05/exercise.dart';

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
      home: ExerciseCustomMultiChildLayout(),
    );
  }
}
