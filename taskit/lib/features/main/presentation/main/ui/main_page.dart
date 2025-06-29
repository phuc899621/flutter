import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/routers/router_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary, // iOS
      ),
    );

    return ProviderScope(
      overrides: [
        navigationShellProvider.overrideWithValue(widget.navigationShell)
      ],
      child: Scaffold(
          key: _scaffoldKey,
          body: widget.navigationShell,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Material(
              elevation: 1,
              color: color.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
              child: NavigationBar(
                height: 70,
                backgroundColor: Colors.transparent,
                destinations: [
                  NavigationDestination(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    label: '',
                    selectedIcon: Icon(
                      Icons.home_rounded,
                      color: color.onPrimaryContainer,
                    ),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.assignment_outlined),
                    label: '',
                    selectedIcon: Icon(
                      Icons.assignment_rounded,
                      color: color.onPrimaryContainer,
                    ),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.calendar_month_outlined),
                    label: '',
                    selectedIcon: Icon(
                      Icons.calendar_month,
                      color: color.onPrimaryContainer,
                    ),
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.settings_outlined,
                    ),
                    label: '',
                    selectedIcon: Icon(
                      Icons.settings_rounded,
                      color: color.onPrimaryContainer,
                    ),
                  )
                ],
                selectedIndex: widget.navigationShell.currentIndex,
                onDestinationSelected: widget.navigationShell.goBranch,
              ),
            ),
          )),
    );
  }
}
