import 'package:flutter/material.dart';
import 'package:flutter_demo/sliver/customscrollview/sliver_persistent_header.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class CustomScrollviewPage2 extends StatelessWidget {
  const CustomScrollviewPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollviewPage2"),
      ),
      body: CustomScrollView(
        slivers: [
          buildSliverList(5),
          SliverPersistentHeaderToBox.builder(builder: headerBuilder),
          buildSliverList(5),
          //SliverPersistentHeaderToBox.builder(builder: headerBuilder),
          SliverPersistentHeaderToBox(child: listItem("Header 2")),
          buildSliverList(50),
        ],
      ),
    );
  }

  Widget headerBuilder(context, maxExtent, fixed) {
    var theme = Theme.of(context);
    return Material(
      elevation: fixed ? 4 : 0,
      shadowColor: theme.appBarTheme.shadowColor,
      child: Container(
        color: fixed ? Colors.white : theme.canvasColor,
        child: listItem("Header 1"),
      ),
    );
  }

  buildSliverList(int counts) {
    return SliverFixedExtentList(
      itemExtent: 56.0,
      delegate: SliverChildBuilderDelegate((BuildContext context,
          int index,) {
        return Container(
          alignment: Alignment.center,
          color: Colors.blue[100 * (index % 9)],
          child: Text('grid item $index', style: TextStyle(fontSize: 20.0)),
        );
      }, childCount: counts),
    );
  }

  Widget listItem(String text) {
    return Container(
      color: Colors.white,
      child: ListTile(title: Text(text), onTap: () => print(text)),
    );
  }
}
