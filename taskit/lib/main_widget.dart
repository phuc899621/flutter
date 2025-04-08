import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app_color.dart';
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
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primaryBackground,
        textTheme: TextTheme(
          displaySmall: TextStyle(
            color: AppColors.primaryText,
          ),
          labelMedium: TextStyle(
            color: AppColors.secondaryText,
          ),
          bodyMedium: TextStyle(
            color: AppColors.primaryText,
          ),
        ),

        //text
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          primaryContainer: AppColors.primaryBackground,
          secondaryContainer: AppColors.secondaryBackground,
          background: AppColors.alternative,
          onPrimary: AppColors.primaryText,
          onSecondary: AppColors.secondaryText,
          onBackground: AppColors.info,
        )

      )
    );
  }
}