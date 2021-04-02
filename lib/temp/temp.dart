import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  final List<String> st = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Listfa(ex: st),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          st.add("a");
          st.add("value");
          setState(() {});
        },
      ),
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
