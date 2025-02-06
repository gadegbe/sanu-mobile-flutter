import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/category/pages/categories_page.dart';
import 'package:sanu/ui/dashboard/pages/dashboard_page.dart';
import 'package:sanu/ui/item/pages/items_page.dart';
import 'package:sanu/ui/settings/pages/settings_page.dart';
import 'package:sanu/ui/stock/pages/stocks_page.dart';

enum MenuItem {
  dashboard,
  categories,
  items,
  stocks,
  settings,
  ;

  String title(BuildContext context) {
    switch (this) {
      case MenuItem.dashboard:
        return context.l10n.dashboardTitle;
      case MenuItem.categories:
        return context.l10n.categoriesTitle;
      case MenuItem.items:
        return context.l10n.itemsTitle;
      case MenuItem.stocks:
        return context.l10n.stocksTitle;
      case MenuItem.settings:
        return context.l10n.settingsTitle;
    }
  }

  IconData icon() {
    switch (this) {
      case MenuItem.dashboard:
        return Symbols.home;
      case MenuItem.categories:
        return Symbols.category;
      case MenuItem.items:
        return Symbols.grocery;
      case MenuItem.stocks:
        return Symbols.monitoring;
      case MenuItem.settings:
        return Symbols.settings;
    }
  }

  String routeName() {
    switch (this) {
      case MenuItem.dashboard:
        return DashboardPage.name;
      case MenuItem.categories:
        return CategoriesPage.name;
      case MenuItem.items:
        return ItemsPage.name;
      case MenuItem.stocks:
        return StocksPage.name;
      case MenuItem.settings:
        return SettingsPage.name;
    }
  }
}
