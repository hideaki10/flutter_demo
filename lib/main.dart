import 'package:flutter/material.dart';
import 'package:flutter_page/temp/temp.dart';

import '03_async/03/stream_builder.dart';
import '03_async/04/tape_game.dart';
import '07_buildcontext/build_contex.dart';
import 'exercise/06/exercise.dart';
import 'exercise/08/exercise.dart';
import 'exercise/09/exercise.dart';

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
      home: FontApp(),
    );
  }
}
