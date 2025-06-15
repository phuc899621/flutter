import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/app/app_color.dart';

import '../../../../../config/app/text_theme.dart';

class MainPage extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  MainPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('MainPage'));

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.read(colorProvider(context));
    final text = ref.read(textStyleProvider(context));
    return Scaffold(
        key: _scaffoldKey,
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home,
              ),
              label: '',
              selectedIcon: Icon(Icons.home_filled),
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: '',
              selectedIcon: Icon(
                Icons.calendar_month_outlined,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: '',
              selectedIcon: Icon(Icons.settings_outlined),
            )
          ],
          onDestinationSelected: navigationShell.goBranch,
          indicatorColor: AppColor(context).primary,
        ));
  }
}
