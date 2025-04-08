import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorPage> {
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GestureDetectorPage")),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation, style: TextStyle(color: Colors.white)),
          ),
          onTap: () => updateText("Tap"), //点击
          onDoubleTap: () => updateText("DoubleTap"), //双击
          onLongPress: () => updateText("LongPress"), //长按
        ),
      ),
    );
  }

  void updateText(String text) {
    /// 更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class GestureDetectorPage2 extends StatefulWidget {
  const GestureDetectorPage2({Key? key}) : super(key: key);

  @override
  _GestureDetectorState2 createState() => _GestureDetectorState2();
}

class _GestureDetectorState2 extends State<GestureDetectorPage2>
    with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GestureDetectorPage2")),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
              /*onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },*/
            ),
          ),
        ],
      ),
    );
  }
}

class GestureDetectorPage3 extends StatefulWidget {
  const GestureDetectorPage3({Key? key}) : super(key: key);

  @override
  _GestureDetectorState3 createState() => _GestureDetectorState3();
}

class _GestureDetectorState3 extends State<GestureDetectorPage3> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GestureDetectorPage3")),
      body: Center(
        child: GestureDetector(
          child: Image.asset("assets/images/lake.jpg", width: _width),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}

class GestureDetectorPage4 extends StatefulWidget {
  const GestureDetectorPage4({Key? key}) : super(key: key);

  @override
  _GestureDetectorState4 createState() => _GestureDetectorState4();
}

class _GestureDetectorState4 extends State<GestureDetectorPage4> {
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _toggle = false;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GestureDetectorPage3")),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Hello World"),
              TextSpan(
                text: "Hello World",
                style: TextStyle(
                  fontSize: 30.0,
                  color: _toggle ? Colors.blue : Colors.red,
                ),
                recognizer:
                    _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
              ),
              TextSpan(text: "Hello World"),
            ],
          ),
        ),
      ),
    );
  }
}
