import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class ImageWidgetPage extends StatelessWidget {
  const ImageWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = AssetImage("assets/images/user_avatar.png");
    return Scaffold(
      appBar: AppBar(title: Text("ImageWidgetPage")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children:
                <Image>[
                  Image(
                    image: AssetImage("assets/images/user_avatar.png"),
                    width: 100.0,
                  ),
                  Image.asset("assets/images/user_avatar.png", width: 100.0),
                  Image(
                    image: NetworkImage(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                    ),
                    width: 100.0,
                  ),
                  Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                    width: 100.0,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference,
                  ),
                  Image(
                    image: img,
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: img,
                    height: 50,
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.fitWidth,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.fitHeight,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.scaleDown,
                  ),
                  Image(
                    image: img,
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.none,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 200.0,
                    repeat: ImageRepeat.repeatY,
                  ),
                ].map((e) {
                  return Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(width: 100, child: e),
                      ),
                      Text(e.fit.toString()),
                    ],
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
