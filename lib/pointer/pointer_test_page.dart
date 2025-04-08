import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class PointerTestPage extends StatefulWidget {
  const PointerTestPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PointerTestState();
}

class _PointerTestState extends State<PointerTestPage> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}

class PointerTestPage2 extends StatefulWidget {
  const PointerTestPage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PointerTestState2();
}

class _PointerTestState2 extends State<PointerTestPage2> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: IgnorePointer(
        child: Listener(
          child: Container(
              color: Colors.red,
              width: 200.0,
              height: 100.0),
          onPointerDown: (event) => print("Pointer inner up"),
        ),
      ),
      onPointerDown: (event) => print("Pointer outer up"),
    );
  }
}
