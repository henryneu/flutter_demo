import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class SwitchBoxPage extends StatefulWidget {
  const SwitchBoxPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SwitchBoxPage();
}

class _SwitchBoxPage extends State<SwitchBoxPage> {
  bool _switchSelected = false;
  bool _checkBoxSelected = false;

  void _handleSwitchSelected() {
    setState(() {
      _switchSelected = !_switchSelected;
    });
  }

  void _handleCheckBoxSelected() {
    setState(() {
      _checkBoxSelected = !_checkBoxSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SwitchBoxPage")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchSelected, //当前状态
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkBoxSelected = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
