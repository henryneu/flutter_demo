import 'package:flutter/material.dart';
import 'package:flutter_demo/route/route_result_page.dart';
import 'package:flutter_demo/widget/button/button_widget_page.dart';
import 'package:flutter_demo/widget/constraints_test_page.dart';
import 'package:flutter_demo/widget/counter/counter_widget_page.dart';
import 'package:flutter_demo/widget/cupertino/cupertino_widget_page.dart';
import 'package:flutter_demo/widget/image/icon_widget_page.dart';
import 'package:flutter_demo/widget/image/image_widget_page.dart';
import 'package:flutter_demo/widget/progress_widget_page.dart';
import 'package:flutter_demo/widget/state/get_state_page.dart';
import 'package:flutter_demo/widget/switch_box_page.dart';
import 'package:flutter_demo/widget/tab/tapbox_widget_page.dart';
import 'package:flutter_demo/widget/text/form_field_page.dart';
import 'package:flutter_demo/widget/text/text_field_page.dart';
import 'package:flutter_demo/widget/text/text_style_page.dart';

import 'custom_painter_page.dart';
import 'layout/flex_layout_page.dart';
import 'layout/wrap_flow_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "tap_box_page": (context) => TapboxWidgetPage(),
        "tips_result_page":
            (context) => RouteResultPage(
              tips: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Click button to jump to the corresponding page:'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounterWidgetPage(),
                    ),
                  );
                },
                child: Text("CounterWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetStatePage()),
                  );
                },
                child: Text("GetStatePage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CupertinoWidgetPage(),
                    ),
                  );
                },
                child: Text("CupertinoWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TapboxWidgetPage()),
                );*/
                  // 命名路由
                  Navigator.pushNamed(context, "tap_box_page");
                },
                child: Text("TapboxWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () async {
                  /*var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteResultPage(tips: "tips"),
                  ),
                );*/
                  // 命名路由，携带参数
                  var result = await Navigator.pushNamed(
                    context,
                    "tips_result_page",
                    arguments: "route named tips",
                  );
                  print("route back result: $result");
                },
                child: Text("RouteResultPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TextStylePage()),
                  );
                },
                child: Text("TextStylePage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonWidgetPage()),
                  );
                },
                child: Text("ButtonWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageWidgetPage()),
                  );
                },
                child: Text("ImageWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IconWidgetPage()),
                  );
                },
                child: Text("IconWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SwitchBoxPage()),
                  );
                },
                child: Text("SwitchBoxPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextFieldPage(),
                    ),
                  );
                },
                child: Text("TextFieldPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormFieldPage(),
                    ),
                  );
                },
                child: Text("FormFieldPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgressWidgetPage(),
                    ),
                  );
                },
                child: Text("ProgressWidgetPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConstraintsTestPage(),
                    ),
                  );
                },
                child: Text("ConstraintsTestPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlexLayoutPage(),
                    ),
                  );
                },
                child: Text("FlexLayoutPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WrapFlowPage(),
                    ),
                  );
                },
                child: Text("WrapFlowPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomPainterPage(),
                    ),
                  );
                },
                child: Text("CustomPainterPage"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
