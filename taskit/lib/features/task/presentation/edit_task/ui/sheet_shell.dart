import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class SheetShell extends ConsumerWidget {
  const SheetShell({
    super.key,
    required this.navigator,
  });

  final Widget navigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, data) {
        logger.i('pop message: $didPop');
        if (!didPop) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          return;
        }
      },
      child: SheetKeyboardDismissible(
        dismissBehavior:
            SheetKeyboardDismissBehavior.onDragDown(isContentScrollAware: true),
        child: PagedSheet(
          shrinkChildToAvoidStaticOverlap: true,
          shrinkChildToAvoidDynamicOverlap: true,
          decoration: MaterialSheetDecoration(
            size: SheetSize.stretch,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            clipBehavior: Clip.antiAlias,
            color: Theme.of(context).colorScheme.surface,
          ),
          builder: (context, child) {
            return SheetContentScaffold(
              bottomBarVisibility: const BottomBarVisibility.always(
                ignoreBottomInset: true,
              ),
              extendBodyBehindTopBar: true,
              extendBodyBehindBottomBar: true,
              body: child,
            );
          },
          navigator: navigator,
        ),
      ),
    );
  }
}
