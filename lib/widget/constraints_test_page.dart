import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ConstraintsTestPage extends StatelessWidget {
  const ConstraintsTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProgressWidgetPage")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 200.0, minHeight: 60.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 240.0, minHeight: 100.0),
                /*child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),*/
                child: Container(color: Colors.red),
              ),
            ),
            SizedBox(height: 12.0),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200.0, maxHeight: 60.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 240.0, maxHeight: 100.0),
                child: Container(color: Colors.red),
                //child: Container(height: 300, width: 300, color: Colors.red),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
