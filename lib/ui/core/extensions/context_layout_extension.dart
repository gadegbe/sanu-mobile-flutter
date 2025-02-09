import 'package:flutter/material.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';

extension LayoutBuildContext on BuildContext {
  bool get showCartWidget => mediaQuery.size.width > 800;
  int get crossAxisCount => ((mediaQuery.size.width - (showCartWidget ? 300 : 0)) / 220).floor();
  bool get showNavigationRail => mediaQuery.size.width > 500;
  bool get isGridView => crossAxisCount > 2;
  bool get showFullTable => mediaQuery.size.width >= 960;
}
