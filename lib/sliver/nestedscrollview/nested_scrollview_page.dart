import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class NestedScrollviewPage extends StatelessWidget {
  const NestedScrollviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabs = <String>['猜你喜欢', '今日特价', '发现更多'];
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text("商城"),
                  pinned: true, // 是否固定, true 固定 AppBar，false 则不固定
                  floating: true, // 是否漂浮
                  snap: false, // 当漂浮时，此参数才有效
                  expandedHeight: 200,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/mine_header_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children:
                _tabs.map((String name) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8),
                            sliver: buildSliverList(50),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }

  buildSliverList(int counts) {
    return SliverFixedExtentList(
      itemExtent: 56.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.blue[100 * (index % 9)],
          child: Text('grid item $index', style: TextStyle(fontSize: 20.0)),
        );
      }, childCount: counts),
    );
  }
}
