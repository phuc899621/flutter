import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainPage extends ConsumerWidget{
  final StatefulNavigationShell navigationShell;
  const MainPage({
    required this.navigationShell,
    Key? key,
}):super(key: key ?? const ValueKey('MainPage'));

  @override
  Widget build(BuildContext context, WidgetRef ref) =>Scaffold(
    body: navigationShell,
    bottomNavigationBar: NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      destinations: [
        NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
            selectedIcon: Icon(
                Icons.home_filled,
                color: Theme.of(context).colorScheme.primaryContainer
            )
        ),
        NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'List',
            selectedIcon: Icon(
              Icons.calendar_month_outlined,
              color: Theme.of(context).colorScheme.primaryContainer
            ),
        ),
        NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
            selectedIcon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).colorScheme.primaryContainer
            ),
        ),
      ],
      onDestinationSelected:navigationShell.goBranch,
      indicatorColor: Theme.of(context).colorScheme.primaryContainer,
    )
  );

}