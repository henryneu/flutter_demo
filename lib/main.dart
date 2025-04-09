import 'package:flutter/material.dart';
import 'package:flutter_demo/pointer/pointer_down_listener_page.dart';
import 'package:flutter_demo/pointer/pointer_test_page.dart';
import 'package:flutter_demo/provider/mall_provider_page.dart';
import 'package:flutter_demo/route/route_result_page.dart';
import 'package:flutter_demo/route/theme_changed_page.dart';
import 'package:flutter_demo/sliver/customscrollview/custom_header_page.dart';
import 'package:flutter_demo/sliver/customscrollview/custom_scrollview_page.dart';
import 'package:flutter_demo/sliver/customscrollview/custom_scrollview_page2.dart';
import 'package:flutter_demo/sliver/gridview/gridview_page.dart';
import 'package:flutter_demo/sliver/listview/animated_list_page.dart';
import 'package:flutter_demo/sliver/listview/listview_page.dart';
import 'package:flutter_demo/sliver/listview/listview_scroll_page.dart';
import 'package:flutter_demo/sliver/nestedscrollview/nested_scrollview_page.dart';
import 'package:flutter_demo/sliver/pageview/pageview_page.dart';
import 'package:flutter_demo/sliver/tabview/tabview_page.dart';
import 'package:flutter_demo/widget/button/button_widget_page.dart';
import 'package:flutter_demo/widget/constraints_test_page.dart';
import 'package:flutter_demo/widget/container/container_page.dart';
import 'package:flutter_demo/widget/counter/counter_widget_page.dart';
import 'package:flutter_demo/widget/cupertino/cupertino_widget_page.dart';
import 'package:flutter_demo/widget/drawer/home_drawer_page.dart';
import 'package:flutter_demo/widget/fitted/fitted_box_page.dart';
import 'package:flutter_demo/widget/image/clip_widget_page.dart';
import 'package:flutter_demo/widget/image/icon_widget_page.dart';
import 'package:flutter_demo/widget/image/image_widget_page.dart';
import 'package:flutter_demo/widget/progress_widget_page.dart';
import 'package:flutter_demo/widget/state/get_state_page.dart';
import 'package:flutter_demo/widget/switch_box_page.dart';
import 'package:flutter_demo/widget/tab/tapbox_widget_page.dart';
import 'package:flutter_demo/widget/text/form_field_page.dart';
import 'package:flutter_demo/widget/text/text_field_page.dart';
import 'package:flutter_demo/widget/text/text_style_page.dart';
import 'package:flutter_demo/widget/transform/transform_change_page.dart';

import 'async/future_builder_page.dart';
import 'async/stream_builder_page.dart';
import 'custom_painter_page.dart';
import 'dialog/dialog_style_page.dart';
import 'gesture/gestur_detector_page.dart';
import 'inherited/inherited_widget_page.dart';
import 'layout/align_center_page.dart';
import 'layout/flex_layout_page.dart';
import 'layout/layout_builder_page.dart';
import 'layout/stack_positioned_page.dart';
import 'layout/wrap_flow_page.dart';
import 'listenable/value_listenable_page.dart';

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
      home: const MyHomePage(title: 'Home Page'),
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
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        /*leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),*/
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.shape_line)),
        ],
      ),
      drawer: HomeDrawerPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Mine"),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
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
                      MaterialPageRoute(
                        builder: (context) => ButtonWidgetPage(),
                      ),
                    );
                  },
                  child: Text("ButtonWidgetPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageWidgetPage(),
                      ),
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
                      MaterialPageRoute(builder: (context) => TextFieldPage()),
                    );
                  },
                  child: Text("TextFieldPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormFieldPage()),
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
                      MaterialPageRoute(builder: (context) => FlexLayoutPage()),
                    );
                  },
                  child: Text("FlexLayoutPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WrapFlowPage()),
                    );
                  },
                  child: Text("WrapFlowPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StackPositionedPage(),
                      ),
                    );
                  },
                  child: Text("StackPositionedPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlignCenterPage(),
                      ),
                    );
                  },
                  child: Text("AlignCenterPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LayoutBuilderPage(),
                      ),
                    );
                  },
                  child: Text("LayoutBuilderPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransformChangePage(),
                      ),
                    );
                  },
                  child: Text("TransformChangePage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContainerPage()),
                    );
                  },
                  child: Text("ContainerPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClipWidgetPage()),
                    );
                  },
                  child: Text("ClipWidgetPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FittedBoxPage()),
                    );
                  },
                  child: Text("FittedBoxPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListviewPage2()),
                    );
                  },
                  child: Text("ListviewPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListviewScrollPage2(),
                      ),
                    );
                  },
                  child: Text("ListviewScrollPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimatedListPage(),
                      ),
                    );
                  },
                  child: Text("AnimatedListPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridviewPage()),
                    );
                  },
                  child: Text("GridviewPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageViewPage()),
                    );
                  },
                  child: Text("PageViewPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TabviewPage()),
                    );
                  },
                  child: Text("TabviewPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomScrollviewPage(),
                      ),
                    );
                  },
                  child: Text("CustomScrollviewPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomHeaderPage(),
                      ),
                    );
                  },
                  child: Text("CustomHeaderPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomScrollviewPage2(),
                      ),
                    );
                  },
                  child: Text("CustomScrollviewPage2"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NestedScrollviewPage(),
                      ),
                    );
                  },
                  child: Text("NestedScrollviewPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InheritedWidgetPage(),
                      ),
                    );
                  },
                  child: Text("InheritedWidgetPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DialogStylePage(),
                      ),
                    );
                  },
                  child: Text("DialogStylePage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MallProviderPage(),
                      ),
                    );
                  },
                  child: Text("MallProviderPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThemeChangedPage(),
                      ),
                    );
                  },
                  child: Text("ThemeChangedPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ValueListenablePage(),
                      ),
                    );
                  },
                  child: Text("ValueListenablePage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureBuilderPage(),
                      ),
                    );
                  },
                  child: Text("FutureBuilderPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StreamBuilderPage(),
                      ),
                    );
                  },
                  child: Text("StreamBuilderPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PointerTestPage2(),
                      ),
                    );
                  },
                  child: Text("PointerTestPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GestureDetectorPage4(),
                      ),
                    );
                  },
                  child: Text("GestureDetectorPage"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PointerDownListenerPage(),
                      ),
                    );
                  },
                  child: Text("PointerDownListenerPage"),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
