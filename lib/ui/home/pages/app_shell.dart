import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sanu/ui/cart/widgets/cart_widget.dart';
import 'package:sanu/ui/core/const.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';
import 'package:sanu/ui/core/extensions/context_layout_extension.dart';
import 'package:sanu/ui/home/menu/menu_item.dart';
import 'package:sanu/ui/message/bloc/message_listener.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int selectedIndex = 0;
  bool isExpanded = false;
  List<MenuItem> items = [
    MenuItem.dashboard,
    MenuItem.categories,
    MenuItem.items,
    MenuItem.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        MessageListener(),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppConfig.isDebugModeActive
                ? '${AppConfig.appName} Size(${context.mediaQuery.size.width} x ${context.mediaQuery.size.height})'
                : AppConfig.appName,
          ),
        ),
        floatingActionButton: context.showCartWidget || items[selectedIndex] != MenuItem.dashboard
            ? null
            : FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    showDragHandle: true,
                    builder: (context) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: CartWidget(),
                      );
                    },
                  );
                },
                child: const Icon(Symbols.sync_alt),
              ),
        bottomNavigationBar: context.showNavigationRail
            ? null
            : BottomNavigationBar(
                backgroundColor: context.colorScheme.surface,
                selectedItemColor: context.colorScheme.primary,
                unselectedItemColor: context.colorScheme.onSurface,
                items: items
                    .map(
                      (item) => BottomNavigationBarItem(
                        icon: Icon(item.icon()),
                        label: item.title(context),
                      ),
                    )
                    .toList(),
                currentIndex: selectedIndex,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  context.goNamed(items[index].routeName());
                },
              ),
        body: Row(
          children: [
            if (context.showNavigationRail) ...[
              NavigationRail(
                extended: isExpanded,
                destinations: items
                    .map(
                      (item) => NavigationRailDestination(
                        icon: Icon(item.icon()),
                        label: Text(item.title(context)),
                      ),
                    )
                    .toList(),
                selectedIndex: selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  context.goNamed(items[index].routeName());
                },
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  const Expanded(child: VerticalDivider(thickness: 1, width: 1)),
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.tertiaryContainer),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      color: context.colorScheme.onTertiaryContainer,
                      icon: Icon(isExpanded ? Symbols.chevron_left : Symbols.chevron_right),
                    ),
                  ),
                ],
              ),
            ],
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
