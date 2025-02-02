import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/core/const.dart';
import 'package:sanu/ui/home/menu/menu_item.dart';
import 'package:sanu/ui/message/bloc/message_listener.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<MenuItem> items = [
    MenuItem.dashboard,
    MenuItem.categories,
    MenuItem.items,
    MenuItem.stocks,
    MenuItem.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        MessageListener(),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text(AppConfig.appName)),
        body: Row(
          children: [
            NavigationRail(
              extended: true,
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
              },
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: items[selectedIndex].builder(context)),
          ],
        ),
      ),
    );
  }
}
