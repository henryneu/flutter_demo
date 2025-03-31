import 'package:flutter/material.dart';

import '../utils/layout_logs_print.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text("Henry"));
    return Scaffold(
      appBar: AppBar(
          title: Text("LayoutBuilderPage")),
      body: Column(
        children: <Widget>[
          // 限制宽度为190，小于 200
          SizedBox(width: 190.0, child: ResponsiveColumn(children: _children)),
          ResponsiveColumn(children: _children),
          LayoutLogsPrint(child: Text("henry")),
        ],
      ),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        if (constrains.maxWidth < 200) {
          return Column(children: children, mainAxisSize: MainAxisSize.min);
        } else {
          var _children = <Widget>[];
          for (int i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(
                Row(
                  children: [children[i], children[i + 1]],
                  mainAxisSize: MainAxisSize.min,
                ),
              );
            } else {
              _children.add(children[i]);
            }
          }
          return Column(children: _children, mainAxisSize: MainAxisSize.min);
        }
      },
    );
  }
}
