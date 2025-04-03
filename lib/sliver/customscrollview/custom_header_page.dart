import 'package:flutter/material.dart';
import 'package:flutter_demo/sliver/customscrollview/custom_sliver_header.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class CustomHeaderPage extends StatelessWidget {
  const CustomHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverFlexibleHeader(
          visibleExtent: 200,
          builder: (context, availableHeight, direction) {
            return GestureDetector(
              onTap: () => print('tap'), //测试是否可以响应事件
              child: Image(
                image: AssetImage("assets/images/mine_header_bg.png"),
                width: 50.0,
                height: availableHeight,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        SliverFixedExtentList(
          itemExtent: 56.0,
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue[100 * (index % 9)],
              child: Text('grid item $index', style: TextStyle(fontSize: 20.0)),
            );
          }, childCount: 50),
        ),
      ],
    );
  }
}
