import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/app/app_color.dart';

import '../../../../../config/app/text_theme.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.read(colorProvider(context));
    final text = ref.read(textStyleProvider(context));
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary, // iOS
      ),
    );
    return Scaffold(
        key: _scaffoldKey,
        body: widget.navigationShell,
        bottomNavigationBar: NavigationBar(
          backgroundColor: color.surfaceContainerHigh,
          surfaceTintColor: color.primary,
          selectedIndex: widget.navigationShell.currentIndex,
          elevation: 10,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: '',
              selectedIcon: Icon(
                Icons.home_rounded,
                color: color.onPrimary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.assignment_outlined),
              label: '',
              selectedIcon: Icon(
                Icons.assignment_rounded,
                color: color.onPrimary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              label: '',
              selectedIcon: Icon(
                Icons.calendar_month,
                color: color.onPrimary,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: '',
              selectedIcon: Icon(
                Icons.settings_rounded,
                color: color.onPrimary,
              ),
            )
          ],
          onDestinationSelected: widget.navigationShell.goBranch,
          indicatorColor: AppColor(context).primary,
        ));
  }
}
