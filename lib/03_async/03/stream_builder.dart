import 'dart:async';

import 'package:flutter/material.dart';

class SteamBuilderExample extends StatelessWidget {
  // final future = Future.delayed(Duration(seconds: 1), () => 21);
  // final steam = Stream.periodic(Duration(seconds: 1), (_) => "21");

  // 一个steam 通常 只能被一个listen监听 如果想要 被多个listen监听 那就使用broadcast
  // controller。broadcast 通常不会有缓存
  // 但是 的 controller 会有缓存
  final exampleController = StreamController.broadcast();

  //取值
  Stream<DateTime> getNumbers() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    // exampleController.stream.listen((event) {
    //   print("${event}");
    // }, onError: (error) => print(error), onDone: () => print("Done"));

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RaisedButton(
            child: Text("212222"),
            onPressed: () => exampleController.sink.add(21222),
          ),
          RaisedButton(
            child: Text("1"),
            onPressed: () => exampleController.sink.add(1),
          ),
          RaisedButton(
            child: Text("error"),
            onPressed: () => exampleController.sink.addError("opps"),
          ),
          RaisedButton(
            child: Text("close"),
            onPressed: () => exampleController.sink.close(),
          ),
          StreamBuilder(
            stream: getNumbers(),
            // exampleController.stream.map((event) => event * 2).distinct(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              // print("building");
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('none');
                  break;
                case ConnectionState.done:
                  return Text('done');
                  break;
                case ConnectionState.active:
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return Text("${snapshot.data}");
                  }
                  break;
                case ConnectionState.waiting:
                  return Text('waiting');
                  break;
              }
              return Container();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //future.then((value) => print(value));
        },
      ),
    );
  }
}
