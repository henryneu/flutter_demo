import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class RouteResultPage extends StatelessWidget {
const RouteResultPage({Key? key, required this.tips}) : super(key: key);

  final String tips;

  @override
  Widget build(BuildContext context) {
    //var tips = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Tips')),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(tips),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "this is back result"),
                child: Text('back result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
