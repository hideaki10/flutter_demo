import 'package:flutter/material.dart';

class SizeBoxShow extends StatefulWidget {
  @override
  _AnimateButtonState createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<SizeBoxShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(),
        child: ListView(
          children: [
            SizedBox(
              height: 280,
              child: _buildBox(),
            ),
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  SizedBox(
                    child: _buildBox(),
                  ),
                  SizedBox(
                    child: _buildBox(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: _buildBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class _buildBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: Container(
            decoration: BoxDecoration(),
            clipBehavior: Clip.antiAlias,
            child: Text('test'),
          ),
        ),
      ],
    );
  }
}
