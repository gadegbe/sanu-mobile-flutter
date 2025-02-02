import 'package:flutter/widgets.dart';

extension ListExt on Iterable<Widget> {
  List<Widget> separated({required Widget separator}) {
    final separatedChildren = <Widget>[];
    for (var i = 0; i < (length * 2) - 1; i++) {
      final itemIndex = i ~/ 2;
      if (i.isOdd) {
        separatedChildren.add(separator);
      } else {
        separatedChildren.add(elementAt(itemIndex));
      }
    }
    return separatedChildren;
  }
}
