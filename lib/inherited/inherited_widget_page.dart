import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class InheritedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetState();
}

class _InheritedWidgetState extends State<InheritedWidgetPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InheritedWidgetPage"),),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              ElevatedButton(
                child: Text("Increment"),
                /// 每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    /// 使用InheritedWidget中的共享数据
    // return Text(ShareDataWidget.of(context).data.toString());
    return Text((context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget as ShareDataWidget).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /// 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    /// 如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    //return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>() as ShareDataWidget;

    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget as ShareDataWidget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return data != old.data;
  }
}
