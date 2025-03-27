import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class CupertinoWidgetPage extends StatelessWidget {
  const CupertinoWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("CupertinoPage"),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text(
            style: TextStyle(color: CupertinoColors.activeOrange),
            "Press",
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
