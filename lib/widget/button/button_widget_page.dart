import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ButtonWidgetPage extends StatelessWidget {
  const ButtonWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ButtonWidgetPage")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              onPressed: () {},
              label: Text("Send"),
            ),
            TextButton(onPressed: () {}, child: Text("TextButton")),
            TextButton.icon(
              icon: Icon(Icons.add_a_photo_rounded),
              onPressed: () {},
              label: Text("Photo"),
            ),
            OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")),
            OutlinedButton.icon(
              icon: Icon(Icons.add_card),
              onPressed: () {},
              label: Text("Card"),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_call)),
          ],
        ),
      ),
    );
  }
}
