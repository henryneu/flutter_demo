import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ClipWidgetPage extends StatelessWidget {
  const ClipWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
        "assets/images/avatar.png",
        width: 60.0,
    );
    return Scaffold(
      appBar: AppBar(title: Text("ClipWidgetPage")),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar,
            ClipOval(child: avatar),
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
                Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                clipper: AvatarClipper(),
                child: avatar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
