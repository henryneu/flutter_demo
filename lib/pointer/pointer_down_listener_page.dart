import 'package:flutter/material.dart';
import 'package:flutter_demo/pointer/pointer_down_listener.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class PointerDownListenerPage extends StatelessWidget {
  const PointerDownListenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PointerDownListener")),
      body: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.blue,
        child: PointerDownListener(
          child: Text(
            "Click me",
            style: TextStyle(fontSize: 32.0, color: Colors.red),
          ),
          onPointerDown: (e) => print('pointer down'),
        ),
      ),
    );
  }
}
