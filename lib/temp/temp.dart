import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  final List<String> st = ["1", "2", "4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Listfa(ex: [...st]),
    );
  }
}

class Listfa extends StatelessWidget {
  final List<String> ex;

  const Listfa({Key key, this.ex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(ex[index]);
        },
        itemCount: ex.length,
      ),
    );
  }
}
