import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
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
        statusBarColor: color.primary, // iOS
      ),
    );

    return ProviderScope(
      overrides: [
        navigationShellProvider.overrideWithValue(widget.navigationShell)
      ],
      child: Scaffold(
          key: _scaffoldKey,
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: _fabAddTask(),
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

  Widget _fabAddTask() {
    final color = Theme.of(context).colorScheme;
    return ExpandableFab(
      distance: 70,
      type: ExpandableFabType.up,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: color.onPrimaryContainer,
        backgroundColor: color.primaryContainer,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: color.surface,
        backgroundColor: color.onSurface,
        shape: const CircleBorder(),
      ),
      children: [
        FloatingActionButton(
            heroTag: 'Add Task',
            shape: CircleBorder(),
            foregroundColor: color.onPrimaryContainer,
            splashColor: color.primary,
            backgroundColor: color.primaryContainer,
            child: Icon(
              Icons.note_alt_outlined,
              size: 30,
            ),
            onPressed: () => context.push('/add_task')),
        FloatingActionButton(
            heroTag: 'Add Task Using Voice',
            shape: CircleBorder(),
            foregroundColor: color.onPrimaryContainer,
            splashColor: color.primary,
            backgroundColor: color.primaryContainer,
            onPressed: () => context.push('/voice'),
            child: Icon(
              Icons.mic,
              size: 30,
            ))
      ],
    );
  }
}
