import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var children = <Widget>[];
    for (int i = 0; i < 6; ++i) {
      children.add(
        Center(
          child: Text(
            '$i',
            style: TextStyle(fontSize: 36.0, color: Colors.black),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text("PageViewPage")),
      body: PageView(children: children),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
