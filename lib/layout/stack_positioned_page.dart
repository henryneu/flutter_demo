import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class StackPositionedPage extends StatelessWidget {
  const StackPositionedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StackPositionedPage")),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 16.0,
              child: Text("I am hide"), // 层叠布局被覆盖
            ),
            Container(
              child: Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            Positioned(
              left: 16.0,
              child: Text("I am Jack"),
            ),
            Positioned(
                top: 16.0,
                child: Text("Your friend"),
            ),
          ],
        ),
      ),
    );
  }
}
