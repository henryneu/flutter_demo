import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/fitted/single_line_fitted_box.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 直接使用Row
    Widget wRow(String text) {
      Widget child = Text(text);
      child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [child, child, child],
      );
      return child;
    }

    return Scaffold(
      appBar: AppBar(title: Text("FittedBoxPage")),
      body: Center(
        child: Column(
          children:
              <Widget>[
                    wRow(' 90000000000000000 '),
                    SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
                    wRow(' 800 '),
                    SingleLineFittedBox(child: wRow(' 800 ')),
                  ]
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: e,
                    ),
                  ).toList(),
        ),
      ),
    );
  }
}
