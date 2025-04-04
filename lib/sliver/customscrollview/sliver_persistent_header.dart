import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'extra_info_constraints.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
typedef SliverPersistentHeaderToBoxBuilder =
    Widget Function(
      BuildContext context,
      double maxExtent, // 当前可用最大高度
      bool fixed, // 是否已经固定
    );

class SliverPersistentHeaderToBox extends StatelessWidget {
  SliverPersistentHeaderToBox({Key? key, required Widget child})
    : builder = ((a, b, c) => child),
      super(key: key);

  SliverPersistentHeaderToBox.builder({Key? key, required this.builder})
    : super(key: key);

  final SliverPersistentHeaderToBoxBuilder builder;

  @override
  Widget build(BuildContext context) {
    return _SliverPersistentHeaderToBox(
      // 通过 LayoutBuilder接收 Sliver 传递给子组件的布局约束信息
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return builder(
            context,
            constraints.maxHeight,
            //约束中需要传递的额外信息是一个bool类型，表示 Sliver 是否已经固定到顶部
            (constraints as ExtraInfoBoxConstraints<bool>).extra,
          );
        },
      ),
    );
  }
}

class _SliverPersistentHeaderToBox extends SingleChildRenderObjectWidget {
  const _SliverPersistentHeaderToBox({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSliverPersistentHeaderToBox();
  }
}

class _RenderSliverPersistentHeaderToBox extends RenderSliverSingleBoxAdapter {
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child!.layout(
      ExtraInfoBoxConstraints(
        // 只要 constraints.scrollOffset 不为 0，则表示已经有内容在当前 Sliver 下面，即已经固定到顶部
        constraints.scrollOffset != 0,
        constraints.asBoxConstraints(
          // 将剩余的可绘制空间作为 header 的最大高度约束传递给 LayoutBuilder
          maxExtent: constraints.remainingCacheExtent,
        ),
      ),
      parentUsesSize: true,
    );

    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
        break;
      case Axis.vertical:
        childExtent = child!.size.height;
        break;
    }

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintOrigin: 0,
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
    );
  }

  @override
  double childMainAxisPosition(RenderBox child) => 0.0;
}
