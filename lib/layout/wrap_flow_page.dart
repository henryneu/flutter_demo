import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class WrapFlowPage extends StatelessWidget {
  const WrapFlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FlexLayoutPage")),
      body: Column(
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Chip(
                label: Text("KobeBryant"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("K"),
                ),
              ),
              Chip(
                label: Text("LebronJames"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("L"),
                ),
              ),
              Chip(
                label: Text("DwyaneWade"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("D"),
                ),
              ),
              Chip(
                label: Text("StephenCurry"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("S"),
                ),
              ),
            ],
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(width: 80.0, height: 80.0, color: Colors.red),
              Container(width: 80.0, height: 80.0, color: Colors.green),
              Container(width: 80.0, height: 80.0, color: Colors.blue),
              Container(width: 80.0, height: 80.0, color: Colors.yellow),
              Container(width: 80.0, height: 80.0, color: Colors.brown),
              Container(width: 80.0, height: 80.0, color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  TestFlowDelegate({this.margin = EdgeInsets.zero});

  EdgeInsets margin;
  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        // 绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
