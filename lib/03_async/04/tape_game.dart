import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class TypeGame extends StatelessWidget {
  final _inputController = StreamController<int>.broadcast();
  final _scoreController = StreamController();

  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextTitle(
          scoreTextStream: _scoreController.stream,
        ),
      ),
      body: Stack(
        children: [
          ...List.generate(
              7,
              (index) => PuzzleNumber(
                    inputStream: _inputController.stream,
                    scoreController: _scoreController,
                  )),
          KeyPad(
            padController: _inputController,
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
                padController.add(index + 1);
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
  final Stream<int> inputStream;
  final StreamController scoreController;
  const PuzzleNumber({Key key, this.inputStream, this.scoreController})
      : super(key: key);

  @override
  _PuzzleNumberState createState() => _PuzzleNumberState();
}

class _PuzzleNumberState extends State<PuzzleNumber>
    with SingleTickerProviderStateMixin {
  int _firstNumber, _secondNumber;
  double x;
  Color _color;

  AnimationController animationController;

  _reset({from = 0.0}) {
    _firstNumber = Random().nextInt(8);
    _secondNumber = Random().nextInt(9 - _firstNumber);
    x = Random().nextDouble() * 300;
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)][200];
    animationController.duration =
        Duration(milliseconds: Random().nextInt(5000) + 3000);
    animationController.forward(from: from);
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    _reset(from: Random().nextDouble());
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _reset();
        widget.scoreController.add(-3);
        //
      }
    });

    widget.inputStream.listen((int input) {
      if (input == _firstNumber + _secondNumber) {
        _reset();
        //
        widget.scoreController.add(5);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Positioned(
          left: x,
          top: 400 * animationController.value - 100,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: _color.withOpacity(0.5),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24)),
            child: Text(
              "$_firstNumber + $_secondNumber",
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
      animation: animationController,
    );
  }
}

class TextTitle extends StatefulWidget {
  final Stream scoreTextStream;

  const TextTitle({Key key, this.scoreTextStream}) : super(key: key);
  @override
  _TextTitleState createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  int score = 0;
  @override
  void initState() {
    widget.scoreTextStream.listen((inputScore) {
      score = score + inputScore;
      setState(() {
        score = score;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Score: $score");
  }
}
