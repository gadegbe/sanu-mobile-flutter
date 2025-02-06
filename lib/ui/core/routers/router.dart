import 'package:go_router/go_router.dart';
import 'package:sanu/ui/category/pages/categories_page.dart';
import 'package:sanu/ui/dashboard/pages/dashboard_page.dart';
import 'package:sanu/ui/home/pages/app_shell.dart';
import 'package:sanu/ui/item/pages/item_details.dart';
import 'package:sanu/ui/item/pages/items_page.dart';
import 'package:sanu/ui/settings/pages/settings_page.dart';
import 'package:sanu/ui/stock/pages/stocks_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: DashboardPage.name,
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/categories',
          name: CategoriesPage.name,
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          path: '/items',
          name: ItemsPage.name,
          builder: (context, state) => const ItemsPage(),
          routes: [
            GoRoute(
              path: 'details',
              name: ItemDetails.name,
              builder: (context, state) {
                return ItemDetails(id: state.uri.queryParameters['id']!);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/stocks',
          name: StocksPage.name,
          builder: (context, state) => const StocksPage(),
        ),
        GoRoute(
          path: '/settings',
          name: SettingsPage.name,
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
  ],
);
