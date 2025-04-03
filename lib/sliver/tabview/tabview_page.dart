import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TabviewPage extends StatefulWidget {
  const TabviewPage({Key? key}) : super(key: key);

  @override
  _TabviewPageState createState() => _TabviewPageState();
}

class _TabviewPageState extends State<TabviewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["语文", "数学", "英语"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabviewPage"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:
            tabs.map((e) {
              return Container(
                alignment: Alignment.center,
                child: Text(e, style: TextStyle(fontSize: 48.0)),
              );
            }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
