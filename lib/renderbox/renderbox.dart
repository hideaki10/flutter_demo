import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestRenderBox extends StatefulWidget {
  @override
  _TestRenderBoxState createState() => _TestRenderBoxState();
}

class _TestRenderBoxState extends State<TestRenderBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dsd"),
      ),
      body: Container(
        width: 300,
        height: 300,
        color: Colors.red[200],
        child: Align(
          child: LayoutBuilder(
            builder: (context, constraints) {
              print(constraints);
              return ShadowBox(
                  // 关于  context.pushOpacity 的distance 设置后 只在第一次build 才有效果，途中修改数值补气效果问题
                  // widget 是immuable 每回会丢弃 然后重新build的时候 会查找element tree
                  // 第一先查找 类型 查找类型时候 发现类型没有改变 所以会用元来 element tree 所以没有更新数值
                  // 第二查找 key 这里没有设置key
                  // 解决办法
                  // updateRenderObject方法
                  distance: 8.0,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      print("szide d");
                      print(constraints);
                      return FlutterLogo(
                        size: 100,
                      );
                    },
                  ));
            },
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyRenderBox extends SingleChildRenderObjectWidget {
  MyRenderBox({Widget child}) : super(child: child);

  //创立renderobject
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
  //layout过程是一遍 遍历  //设置尺寸
  @override
  void performLayout() {
    //像子元素传递约束
    print(constraints);

    //不依赖子组件的尺寸时候 parentUsesSize设置为false 可以有效防止 render重画 从而改善性能
    child.layout(BoxConstraints.tight(Size(50, 50)), parentUsesSize: true);
    size = Size(300, 300);
    //ize = (child as RenderBox).size;
    // 设置自己的size
  }

  //paint又是另一边遍历、且和layout没有直接关系，可以随意画只在任何地方
  //绘制 不设置绘图
  @override
  void paint(PaintingContext context, Offset offset) {
    print(offset);
    //绘制
    context.paintChild(child, offset + Offset(100, 200));
    context.paintChild(child, offset + Offset(0, 200));
  }
}

//
//
//
//绘制阴影
//使用renderobject
class ShadowBox extends SingleChildRenderObjectWidget {
  ShadowBox({Widget child, this.distance}) : super(child: child);
  final double distance;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderShadowBox(distance);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderShadowBox renderObject) {
    renderObject.distance = distance;
  }
}

//
//
//
//绘制阴影
class RenderShadowBox extends RenderBox with RenderObjectWithChildMixin {
  double distance;

  RenderShadowBox(this.distance);

  //设置约束
  @override
  void performLayout() {
    child.layout(BoxConstraints.tight(Size(150, 150)), parentUsesSize: true);
    size = (child as RenderBox).size;
  }

  //绘制childwidget
  @override
  void paint(PaintingContext context, Offset offset) {
    print(distance);
    context.paintChild(child, offset);

    //阴影效果
    // alpha 值的通道 0 ～ 250
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child, offset + Offset(distance, distance));
    });
  }
}

class RenderShadowsBox extends RenderProxyBox with DebugOverflowIndicatorMixin {
  double distance;

  RenderShadowsBox(this.distance);

  //   @override
  void paint(PaintingContext context, Offset offset) {
    print(distance);
    context.paintChild(child, offset);

    //阴影效果
    // alpha 值的通道 0 ～ 250
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child, offset + Offset(distance, distance));
    });
    print(size);
    print("-----");
    print(child.size);
    // 第三参数 可以容纳的尺寸
    // 第四参数 实际child的尺寸
    paintOverflowIndicator(context, offset, offset & size, offset & child.size);
  }
}
