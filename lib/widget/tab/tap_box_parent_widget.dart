import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TapBoxParentWidget extends StatefulWidget {
  const TapBoxParentWidget({Key? key}) : super(key: key);

  @override
  _TapBoxParentWidgetState createState() => _TapBoxParentWidgetState();
}

class _TapBoxParentWidgetState extends State<TapBoxParentWidget> {
  bool _change = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _change = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxWidgetB(active: _change, onChange: _handleTapBoxChanged),
    );
  }
}

class TapBoxWidgetB extends StatelessWidget {
  const TapBoxWidgetB({Key? key, this.active = false, required this.onChange})
    : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  void _handleTab() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTab,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
