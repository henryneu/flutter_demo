import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  static InheritedProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider>()
        as InheritedProvider;
  }

  @override
  bool updateShouldNotify(InheritedProvider old) {
    return true;
  }
}
