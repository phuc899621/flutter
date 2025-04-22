import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/app/app_color.dart';

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
            icon: Icon(Icons.home,
              color: AppColor(context).secondaryText,
            ),
            label: '',
            selectedIcon: Icon(
                Icons.home_filled,
                color: Theme.of(context).colorScheme.primaryContainer
            ),
        ),
        NavigationDestination(
            icon: Icon(Icons.calendar_month,
                color: AppColor(context).secondaryText
            ),
            label: '',
            selectedIcon: Icon(
              Icons.calendar_month_outlined,
              color: Theme.of(context).colorScheme.primaryContainer
            ),
        ),
        NavigationDestination(
            icon: Icon(
                Icons.settings,color: AppColor(context).secondaryText
            ),
            label: '',
            selectedIcon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).colorScheme.primaryContainer
            ),
        ),
      ],
      onDestinationSelected:navigationShell.goBranch,
      indicatorColor: Theme.of(context).colorScheme.primary,
    )
  );

}