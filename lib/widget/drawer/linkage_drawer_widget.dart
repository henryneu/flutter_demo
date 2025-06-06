import 'dart:math' as math;
import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class LinkageDrawerWidget extends StatefulWidget {
  final Size size;

  LinkageDrawerWidget({required this.size});

  @override
  State<StatefulWidget> createState() {
    return _LinkageDrawerState(size);
  }
}

enum DrawerLvl { LVL1, LVL2, LVL3 }

enum SlideDirection { Up, Down }

class _LinkageDrawerState extends State<LinkageDrawerWidget>
    with SingleTickerProviderStateMixin {
  late final Size size;

  /// 最大高度
  late double drawerHeight;

  /// 中等高度
  final double searchHeight = 300;

  /// 最小高度
  final double minHeight = 150;

  final double paddingTop = 70;

  /// 层级之间的阈值
  late double threshold1To2;
  late double threshold2To3;

  _LinkageDrawerState(this.size) {
    drawerHeight = size.height - paddingTop;
    threshold1To2 = size.height / 3;
    threshold2To3 = size.height - 250;
  }

  late AnimationController animationController;
  Animation? animation;

  /// 内部 扩展区widget的 position top
  late double expandPosTop;

  /// drawer 内部 多功能区域的滑动范围 0  -  rowH*2
  late double topArea;

  /// stack 中 根container 的position 的top 值的三种情况
  late double top1; // DrawerLvl   lvl 1
  late double top2; // DrawerLvl   lvl 2
  late double top3; // DrawerLvl   lvl 3

  /// 页面初始
  late double initPositionTop;

  /// 抽屉层级
  DrawerLvl drawerLvl = DrawerLvl.LVL2;

  /// 滑动方向
  late SlideDirection direction = SlideDirection.Up;

  @override
  void initState() {
    expandPosTop = searchHeight - minHeight + rowH;
    topArea = 0;
    log('init top', '$expandPosTop');

    top1 = size.height - drawerHeight;
    top2 = size.height - searchHeight;
    top3 = size.height - minHeight;
    initPositionTop = top2;
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animationController.addListener(() {
      refreshExpandWidgetTop();
      if (animation != null) {
        setState(() {
          log('animation', '${animation?.value}');
          initPositionTop = animation?.value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.greenAccent,
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: initPositionTop,
              child: GestureDetector(
                onVerticalDragStart: verticalDragStart,
                onVerticalDragUpdate: verticalDragUpdate,
                onVerticalDragEnd: verticalDragEnd,
                child: Container(
                  width: size.width,
                  height: drawerHeight,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        /// search
                        alignment: Alignment.center,
                        color: Colors.pink,
                        width: size.width,
                        height: searchHeight - minHeight,
                        child: Text('我是搜索'),
                      ),
                      Positioned(
                        /// transform
                        top: searchHeight - minHeight,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          width: size.width,
                          height: rowH * 3 + 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              normalRow(),
                              normalRow(),
                              Container(
                                color: Colors.grey[300],
                                width: size.width,
                                height: rowH,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '常去的地方',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        /// expand area
                        top: expandPosTop + topArea,
                        child: Container(
                          color: Colors.lightGreen,
                          alignment: Alignment.topCenter,
                          width: size.width,
                          height: drawerHeight - searchHeight - rowH,
                          /// 这里需要在滚动时向下滑动
                          child: Text('我是扩展区域'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 刷新 扩展区域的 position top值
  /// 这里的差值是 rowH * 2
  refreshExpandWidgetTop() {
    /// 首先，根据initPositionTop，和top2 - top1 之间的差值，来计算滑动进度
    double progress = (initPositionTop - top2).abs() / (top2 - top1).abs();
    if (drawerLvl == DrawerLvl.LVL2) {
      /// lvl2 滑向 lvl3时 不做处理
      if (initPositionTop > top2) return;
      log('progress', '$progress');
      /// 当初为了加别的，这里的代码写的有点多余
      topArea = (progress * (rowH * 2).clamp(0, rowH * 2));
    } else if (drawerLvl == DrawerLvl.LVL1) {
      /// lvl2 滑向 lvl3时 不做处理
      if (initPositionTop > top2) return;
      topArea = (progress) * (rowH * 2).clamp(0, rowH * 2);
    }
  }

  ///变形金刚区的单行高
  final double rowH = 75;

  Widget normalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        normalCircle(),
        normalCircle(),
        normalCircle(),
        normalCircle(),
      ],
    );
  }

  final double circleSize = 65;

  Widget normalCircle() {
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        shape: BoxShape.circle,
      ),
    );
  }

  late Offset lastPos;

  /// cacheDy 避免滑动过快溢出范围导致的判断失效
  final double cacheDy = 5.0;

  markDrawerLvl() {
    double l1 = (top1 - initPositionTop).abs();
    double l2 = (top2 - initPositionTop).abs();
    double l3 = (top3 - initPositionTop).abs();

    if (l1 == (math.min(l1, math.min(l2, l3)))) {
      drawerLvl = DrawerLvl.LVL1;
    } else if (l2 == (math.min(l1, math.min(l2, l3)))) {
      drawerLvl = DrawerLvl.LVL2;
    } else {
      drawerLvl = DrawerLvl.LVL3;
    }
    log('lvl', '$drawerLvl');
  }

  void verticalDragStart(DragStartDetails details) {
    markDrawerLvl();
    animation = null;
    if (animationController.isAnimating) {
      animationController.stop();
    }
    animationController.reset();
    lastPos = details.globalPosition;
    log('start', '$initPositionTop');
  }

  void verticalDragUpdate(DragUpdateDetails details) {
    double dis = details.globalPosition.dy - lastPos.dy;
    if (dis < 0) {
      direction = SlideDirection.Up;
    } else {
      direction = SlideDirection.Down;
    }

    if (direction == SlideDirection.Up) {
      /// 避免 drawer 滑出屏幕
      if (initPositionTop <= top1 + cacheDy) return;
    } else if (direction == SlideDirection.Down) {
      if (initPositionTop >= top3 - cacheDy) return;
    }
    log('update', '$initPositionTop');

    initPositionTop += dis;
    lastPos = details.globalPosition;
    refreshExpandWidgetTop();
    setState(() {});
  }

  void verticalDragEnd(DragEndDetails details) {
    adjustPositionTop(details);
  }

  double thresholdV = 1500;

  void adjustPositionTop(DragEndDetails details) {
    log('velocity', '${details.velocity}');
    switch (direction) {
      case SlideDirection.Up:
        if (details.velocity.pixelsPerSecond.dy.abs() > thresholdV) {
          /// 用户fling速度超过阈值后，直接判定为滑向顶部
          switch (drawerLvl) {
            case DrawerLvl.LVL1:
              /// 已经处于顶部，上滑时，不需要做处理
              break;
            case DrawerLvl.LVL2:
              slideTo(begin: initPositionTop, end: top1);
              break;
            case DrawerLvl.LVL3:
              slideTo(begin: initPositionTop, end: top2);
              break;
          }
        } else {
          if (initPositionTop >= top1 && initPositionTop <= top2) {
            /// 在1、2级之间
            if (initPositionTop <= threshold1To2) {
              /// 小于二分之一屏幕高度 滚向top1
              slideTo(begin: initPositionTop, end: top1);
            } else {
              /// 滑向top2
              slideTo(begin: initPositionTop, end: top2);
            }
          } else if (initPositionTop >= top2 && initPositionTop <= top3) {
            /// 2-3之间
            if (initPositionTop <= threshold2To3) {
              /// 滑向2
              slideTo(begin: initPositionTop, end: top2);
            } else {
              /// 滑向3
              slideTo(begin: initPositionTop, end: top3);
            }
          }
        }
        break;
      case SlideDirection.Down:
        if (details.velocity.pixelsPerSecond.dy.abs() > thresholdV) {
          switch (drawerLvl) {
            case DrawerLvl.LVL1:
              slideTo(begin: initPositionTop, end: top2);
              break;
            case DrawerLvl.LVL2:
              slideTo(begin: initPositionTop, end: top3);
              break;
            case DrawerLvl.LVL3:
              //todo nothing
              break;
          }
        } else {
          if (initPositionTop >= top1 && initPositionTop <= top2) {
            /// 在1、2级之间
            if (initPositionTop <= threshold1To2) {
              /// 小于二分之一屏幕高度 滚向top1
              slideTo(begin: initPositionTop, end: top1);
            } else {
              /// 滑向top2
              slideTo(begin: initPositionTop, end: top2);
            }
          } else if (initPositionTop >= top2 && initPositionTop <= top3) {
            /// 2-3之间
            if (initPositionTop <= threshold2To3) {
              /// 滑向2
              slideTo(begin: initPositionTop, end: top2);
            } else {
              /// 滑向3
              slideTo(begin: initPositionTop, end: top3);
            }
          }
        }
        break;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  slideTo({required double begin, required double end}) async {
    animation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(animationController);
    await animationController.forward();
  }

  log(String title, String info) {
    debugPrint('$title ---- $info');
  }
}
