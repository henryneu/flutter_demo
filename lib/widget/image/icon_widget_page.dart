import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class IconWidgetPage extends StatelessWidget {
  const IconWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icons = "";
    // accessible: 0xe03e
    icons += "\uE03e";
    // error:  0xe237
    icons += " \uE237";
    // fingerprint: 0xe287
    icons += " \uE287";

    return Scaffold(
      appBar: AppBar(title: Text("ImageWidgetPage")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/user_avatar.png", width: 100.0),
              Text(
                icons,
                style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 26.0,
                  color: Colors.green,
                ),
              ),
              Icon(Icons.accessible, color: Colors.green),
              Icon(Icons.error, color: Colors.green),
              Icon(Icons.fingerprint, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
