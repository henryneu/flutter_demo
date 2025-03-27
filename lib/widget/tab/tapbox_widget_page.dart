import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/tab/tap_box_mix_widget.dart';
import 'package:flutter_demo/widget/tab/tap_box_parent_widget.dart';
import 'package:flutter_demo/widget/tab/tap_box_widget.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TapboxWidgetPage extends StatelessWidget {
  const TapboxWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TapboxWidgetPage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TapBoxWidget(),
            SizedBox(height: 8.0),
            TapBoxParentWidget(),
            SizedBox(height: 8.0),
            TapBoxMixWidget(),
          ],
        ),
      ),
    );
  }
}
