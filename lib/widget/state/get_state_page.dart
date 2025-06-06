import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class GetStatePage extends StatefulWidget {
  const GetStatePage({Key? key}) : super(key: key);

  @override
  _GetStatePageState createState() => _GetStatePageState();
}

class _GetStatePageState extends State<GetStatePage> {
  static final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  DateTime? _lastPressedAt; //上次点击时间

  Future<bool> _handlePop() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
      _lastPressedAt = DateTime.now();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Get Parent State"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldState _state =
                        context.findAncestorStateOfType<ScaffoldState>()!;
                    _state.openDrawer();
                  },
                  child: Text("Open Drawer 1"),
                );
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldState _state = Scaffold.of(context);
                    _state.openDrawer();
                  },
                  child: Text("Open Drawer 2"),
                );
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  child: Text("Open Drawer 3"),
                );
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(child: Text("This is SnackBar")),
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  },
                  child: Text("Show the SnackBar"),
                );
              },
            ),
            PopScope(
              canPop: true,
              child: Container(
                alignment: Alignment.center,
                child: Text("1秒内连续按两次返回键退出"),
              ),
              onPopInvokedWithResult: (didPop, result) async {
                if (didPop) return;
                final allowed = await _handlePop();
                if (allowed && mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: Center(child: Text("data")),
      ),
    );
  }
}
