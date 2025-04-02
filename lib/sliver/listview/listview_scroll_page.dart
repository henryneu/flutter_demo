import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ListviewScrollPage extends StatefulWidget {
  const ListviewScrollPage({Key? key}) : super(key: key);

  @override
  _ListviewScrollState createState() => _ListviewScrollState();
}

class _ListviewScrollState extends State<ListviewScrollPage> {
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print("Scroll Offset:" + '$_scrollController.offset');
      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListviewScrollPage")),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          prototypeItem: ListTile(title: Text("1")),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'));
          },
          controller: _scrollController,
        ),
      ),
      floatingActionButton:
          !showToTopBtn
              ? null
              : FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    .0,
                    duration: Duration(microseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Icon(Icons.arrow_upward),
              ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ListviewScrollPage2 extends StatefulWidget {
  const ListviewScrollPage2({Key? key}) : super(key: key);

  @override
  _ListviewScrollState2 createState() => _ListviewScrollState2();
}

class _ListviewScrollState2 extends State<ListviewScrollPage2> {
  String _progress = "0%";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListviewScrollPage")),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress =
                notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('$index'));
                },
              ),
              CircleAvatar(
                radius: 36.0,
                child: Text(
                  _progress,
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
