import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_page/03_async/03/stream_builder.dart';

class TypeGame extends StatelessWidget {
  final _controller = StreamController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: _controller.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data}");
            }
            return Text("waiting");
          },
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: PuzzleNumber(),
          ),
          KeyPad(
            padController: _controller,
          )
        ],
      ),
    );
  }
}

class KeyPad extends StatelessWidget {
  final padController;

  const KeyPad({Key key, this.padController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.red,
        child: GridView.count(
          shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 2 / 1,
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.primaries[index][200])),
              onPressed: () {
                padController.add("${index + 1}");
              },
              child: Text(
                "${index + 1}",
                style: TextStyle(fontSize: 23),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class PuzzleNumber extends StatefulWidget {
  @override
  _PuzzleNumberState createState() => _PuzzleNumberState();
}

class _PuzzleNumberState extends State<PuzzleNumber> {
  int _firstNumber, _secondNumber;
  Color _color;

  @override
  void initState() {
    _firstNumber = Random().nextInt(8);
    _secondNumber = 9 - _firstNumber;
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)][200];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: _color,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(24)),
      child: Text(
        "$_firstNumber + $_secondNumber",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
