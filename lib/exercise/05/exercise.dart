import 'package:flutter/material.dart';

class ExerciseCustomMultiChildLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Diagonal(
        children: [
          FlutterLogo(),
          Text('tai'),
          Text('tai'),
          Text('tai'),
        ],
      ),
    );
  }
}

class Diagonal extends StatelessWidget {
  final List<Widget> children;

  //Diagonal({this.children ,Key key}): super(key:key);
  Diagonal({this.children});

  @override
  Widget build(BuildContext context) {
    List<LayoutId> layoutIdList = [];
    for (int i = 0; i < children.length; i++) {
      layoutIdList.add(LayoutId(
        id: i,
        child: children[i],
      ));
    }
    return CustomMultiChildLayout(
      delegate: MyDelegate(),
      children: layoutIdList,
      //for (int i = 0; i < children.length; i++) {
      //LayoutId(
      //  id: i ,
      //  child: children[i],
      //)
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // if (hasChild(1)) {
    //   size = layoutChild(1, BoxConstraints.loose(size));
    // }
    // positionChild(1, Offset(0, 0));
    // if (hasChild(2)) {
    //   size2 = layoutChild(2, BoxConstraints.loose(size));
    // }
    // positionChild(
    //     2, Offset(size.width + size2.width, size.height + size2.height));
    // if (hasChild(3)) {
    //   size3 = layoutChild(3, BoxConstraints.loose(size));
    // }
    // positionChild(
    //     3,
    //     Offset(size.width + size2.width + size3.width,
    //         size.height + size2.height + size3.height));
    // if (hasChild(4)) {
    //   size4 = layoutChild(4, BoxConstraints.loose(size));
    // }
    // positionChild(
    //     4,
    //     Offset(size.width + size2.width + size3.width + size4.width,
    //         size.height + size2.height + size3.height + size4.height));

    Offset offset = Offset.zero;
    for (int i = 0;; i++) {
      if (hasChild(i)) {
        final childSize = layoutChild(i, BoxConstraints.loose(size));
        positionChild(i, offset);
        offset += Offset(childSize.width, childSize.height);
      } else {
        break;
      }
    }
  }

  @override
  bool shouldRelayout(_) => false;
}
