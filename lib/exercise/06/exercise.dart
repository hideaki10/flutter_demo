import 'package:flutter/material.dart';

class AnimateButton extends StatefulWidget {
  @override
  _AnimateButtonState createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<AnimateButton> {
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _flag ? 60 : 200,
          height: 60,
          //
          child: Material(
            //
            color: Colors.black,
            //阴影
            elevation: 4,
            //
            shape: StadiumBorder(),
            child: InkWell(
              //
              customBorder: StadiumBorder(),
              //
              onTap: () {
                setState(() {
                  _flag = !_flag;
                });
              },
              //child切换animate
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: _flag
                    ? Icon(Icons.arrow_forward_rounded, color: Colors.white)
                    : Text(
                        'Ready!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
