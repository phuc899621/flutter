import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';
import 'package:taskit/config/routers/router_provider.dart';

class MainWidget extends ConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        //primary
        primaryColor: ConstColor.primary,
        scaffoldBackgroundColor: ConstColor.primaryBackground,
        textTheme: TextTheme(
          displaySmall: TextStyle(
            color: ConstColor.primaryText,
          ),
          labelMedium: TextStyle(
            color: ConstColor.secondaryText,
          ),
          bodyMedium: TextStyle(
            color: ConstColor.primaryText,
          ),

        ),

        //text
        colorScheme: ColorScheme.light(
          primary: ConstColor.primary,
          secondary: ConstColor.secondary,
          primaryContainer: ConstColor.primaryBackground,
          secondaryContainer: ConstColor.secondaryBackground,
          onPrimary: ConstColor.onPrimary,
          onSecondary: ConstColor.onSecondary,
          onPrimaryContainer: ConstColor.primaryText,
          onSecondaryContainer: ConstColor.secondaryText,
          onError: ConstColor.error,
          onSurface: ConstColor.secondaryText,


        )

      )
    );
  }
}