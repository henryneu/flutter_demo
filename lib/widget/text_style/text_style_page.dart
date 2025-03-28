import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TextStylePage extends StatelessWidget {
  const TextStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextStyle")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "URL:", style: TextStyle(fontSize: 20.0)),
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello world!", textAlign: TextAlign.left),
                  Text("Hi, I am Jack"),
                  Text(
                    "data",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      inherit: false,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      height: 1.2,
                      fontFamily: "Courier",
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
