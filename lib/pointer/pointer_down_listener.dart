import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class PointerDownListener extends SingleChildRenderObjectWidget {
  PointerDownListener({Key? key, this.onPointerDown, Widget? child}) : super(key: key);

  final PointerDownEventListener? onPointerDown;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPointerDownListener()
        ..onPointerDown = onPointerDown;
  }

  @override
  void updateRenderObject(BuildContext context, RenderPointerDownListener renderObject) {
    renderObject.onPointerDown = onPointerDown;
  }
}

class RenderPointerDownListener extends RenderProxyBox {
  PointerDownEventListener? onPointerDown;

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    if (event is PointerDownEvent) onPointerDown?.call(event);
  }
}
