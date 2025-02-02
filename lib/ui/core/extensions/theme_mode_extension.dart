import 'package:flutter/material.dart';
import 'package:sanu/l10n/l10n.dart';

extension XThemeMode on ThemeMode {
  static const rawSystem = 'system';
  static const rawLight = 'light';
  static const rawDark = 'dark';

  String title(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.l10n.themeSystem;
      case ThemeMode.light:
        return context.l10n.themeLight;
      case ThemeMode.dark:
        return context.l10n.themeDark;
    }
  }
}
