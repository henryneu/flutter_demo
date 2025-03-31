import 'dart:math' as math;
import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TransformChangePage extends StatelessWidget {
  const TransformChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TransformChangePage")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 48.0,
            ),
            child: Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: Offset(-24.0, -5.0),
              child: Text('Hello World!'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text('Hello World!'),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5, //放大到1.5倍
              child: Text("Hello world!"),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(scale: 1.5, child: Text("Hello world!")),
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0)),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(quarterTurns: 1, child: Text("Hello world!")),
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.translate( // 先平移
                offset: Offset(-24.0, -5.0),
                child: Transform.rotate( // 再旋转
                  angle: math.pi / 2,
                  child: Text('Hello World!'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate( // 先旋转
                angle: math.pi / 2,
                child: Transform.translate( // 再平移
                  offset: Offset(-24.0, -5.0),
                  child: Text('Hello World!'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
