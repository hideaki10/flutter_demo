import 'package:flutter/material.dart';

//costomMultiChildLayout
//需要将话的子组件通过参数传进去，负责就无法画出widget
//如果不想传组件进去，而是直接在class/方法里面直接画widegt的话
//需要使用renderobject的paint方法来自己绘制
class CustomChildLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomMultiChildLayout(
        delegate: MyDelegate(),
        children: [
          //子组件
          //设置layoutId1
          LayoutId(id: 1, child: FlutterLogo()),
          //子组件
          //设置layoutId2
          LayoutId(id: 2, child: FlutterLogo()),
        ],
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  //
  Size size1;
  Size size2;
  @override
  void performLayout(Size size) {
    if (hasChild(1)) {
      size1 = layoutChild(
        1,
        //设置约束
        // BoxConstraints.tight(Size(100, 100)
        // 松约束
        BoxConstraints.loose(size),
      );

      // 决定子约束的位置
      positionChild(1, Offset(0, 0));
    }

    if (hasChild(2)) {
      size2 = layoutChild(
        2,
        //设置约束
        BoxConstraints(
            maxWidth: 200, minWidth: 200, minHeight: 200, maxHeight: 200),
      );
      //
      positionChild(2, Offset(size1.width, size1.height));
    }
  }

  //是否需要重新布局
  @override
  bool shouldRelayout(_) {
    return true;
  }
}
