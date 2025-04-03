import 'package:flutter/material.dart';

import '../sliver_header_delegate.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class CustomScrollviewPage extends StatelessWidget {
  const CustomScrollviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollview"),
              background: Image.asset(
                "assets/images/mine_header_bg.png",
                height: 250,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
         /* SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: PageView(
                children: [Text("1"), Text("2")],
              ),
            ),
          ),*/
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate.fixedHeight( //固定高度
              height: 50,
              child: buildHeader(1),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate.fixedHeight( //固定高度
              height: 50,
              child: buildHeader(2),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}
