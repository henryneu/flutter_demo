import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ValueListenablePage extends StatefulWidget {
  const ValueListenablePage({Key? key}) : super(key: key);

  @override
  _ValueListenablePageState createState() => _ValueListenablePageState();
}

class _ValueListenablePageState extends State<ValueListenablePage> {
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ValueListenablePage")),
      body: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text(
                  '$value 次',
                  textScaler: TextScaler.linear(textScaleFactor),
                ),
              ],
            );
          },
          valueListenable: _counter,
          child: const Text(
            '点击了 ',
            textScaler: TextScaler.linear(textScaleFactor),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter.value += 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
