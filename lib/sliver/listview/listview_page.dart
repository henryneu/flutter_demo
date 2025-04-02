import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ListviewPage1 extends StatelessWidget {
  const ListviewPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListviewPage")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
        ],
      ),
    );
  }
}

class ListviewPage2 extends StatelessWidget {
  const ListviewPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FlexLayoutPage")),
      body: Column(
        children: [
          ListTile(title: Text("数字列表")),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              //itemExtent: 50.0,
              prototypeItem: ListTile(title: Text("1")),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListviewPage3 extends StatelessWidget {
  const ListviewPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(title: Text("FlexLayoutPage")),
      body: ListView.separated(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }
}

class ListviewPage4 extends StatefulWidget {
  const ListviewPage4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Listview4State();
}

class _Listview4State extends State<ListviewPage4> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FlexLayoutPage")),
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (BuildContext context, int index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text("没有更多了", style: TextStyle(color: Colors.grey)),
              );
            }
          }
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.blue);
        },
      ),
    );
  }
}
