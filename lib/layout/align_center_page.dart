import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class AlignCenterPage extends StatelessWidget {
  const AlignCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StackPositionedPage")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue.shade50,
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.topRight,
              child: FlutterLogo(size: 60),
            ),
          ),
          Container(
            color: Colors.red.shade50,
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment(2, 0.0),
              child: FlutterLogo(size: 60),
            ),
          ),
          Container(
            color: Colors.blue[50],
            width: 120.0,
            height: 120.0,
            child: Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: FlutterLogo(size: 60),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
                child: Text("xxx")),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text("xxx")),
          ),
        ],
      ),
    );
  }
}
