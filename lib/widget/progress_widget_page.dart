import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ProgressWidgetPage extends StatefulWidget {
  const ProgressWidgetPage({Key? key}) : super(key: key);

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidgetPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProgressWidgetPage")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: ColorTween(
                  begin: Colors.grey,
                  end: Colors.blue,
                ).animate(_animationController),
                value: _animationController.value,
              ),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(
                  begin: Colors.grey,
                  end: Colors.blue,
                ).animate(_animationController),
                value: _animationController.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
