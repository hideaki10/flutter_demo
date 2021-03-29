import 'package:flutter/material.dart';

class ExampleBuildContext extends StatefulWidget {
  @override
  _ExampleBuildContextState createState() => _ExampleBuildContextState();
}

class _ExampleBuildContextState extends State<ExampleBuildContext> {
  @override
  Widget build(BuildContext context) {
    print(context);
    //print(((context as Element).findRenderObject() as RenderBox).size);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [Text("ddd"), Text('ddd')],
          ),
        ),
        drawer: Drawer(),
        floatingActionButton:
            // 2 使用LayoutBuilder(多数情况下使用 Builder 因为并不需要constraints)
            Builder(
          builder: (context) {
            print(context);
            (context as Element).findAncestorStateOfType();
            (context as Element).dependOnInheritedWidgetOfExactType();
            return FloatingActionButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.add),
            );
          },
        )
        //FolatButton(),
        );
  }
}

// 1 种 将context的层数往下移动
class FolatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      child: Icon(Icons.add),
    );
  }
}
