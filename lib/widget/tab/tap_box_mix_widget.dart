import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TapBoxMixWidget extends StatefulWidget {
  const TapBoxMixWidget({Key? key}) : super(key: key);

  @override
  _TapBoxMixWidgetState createState() => _TapBoxMixWidgetState();
}

class _TapBoxMixWidgetState extends State<TapBoxMixWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxWidgetC(active: _active, onChange: _handleTapBoxChanged),
    );
  }
}

class TapBoxWidgetC extends StatefulWidget {
  const TapBoxWidgetC({Key? key, this.active = false, required this.onChange})
    : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  @override
  State<StatefulWidget> createState() => _TapBoxWidgetC();
}

class _TapBoxWidgetC extends State<TapBoxWidgetC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      child: Container(
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border:
              _highlight
                  ? Border.all(color: Colors.teal, width: 10.0)
                  : null,
        ),
        width: 200.0,
        height: 200.0,
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
