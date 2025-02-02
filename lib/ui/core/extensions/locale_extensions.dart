import 'package:flutter/material.dart';
import 'package:sanu/l10n/l10n.dart';

extension XLocale on Locale {
  String title(BuildContext context) {
    switch (languageCode) {
      case 'fr':
        return context.l10n.localeFr;
      case 'en':
        return context.l10n.localeEn;
      default:
        return '';
    }
  }
}
