import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_text/shimmer_text.dart';
import 'package:taskit/features/user/presentation/providers/user_provider.dart';

import '../../../../../../shared/config/routers/router_provider.dart';
import '../../../../../../shared/extension/date_time.dart';
import '../../../list/controller/list_controller.dart';

class HomeAppBar extends ConsumerWidget {
  final VoidCallback onLogout;

  const HomeAppBar({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;

    return SliverAppBar(
      expandedHeight: 180,
      snap: true,
      pinned: true,
      floating: true,
      toolbarHeight: 80,
      centerTitle: false,
      backgroundColor: color.primary,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double top = constraints.biggest.height;
          final bool isCollapsed = top <= 90;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isCollapsed
                ? _buildCollapsed(context)
                : _buildExpanded(context, ref),
          );
        },
      ),
      titleSpacing: 15,
      actions: [
        _SearchButton(),
        const SizedBox(width: 10),
        _LogoutButton(onLogout: onLogout),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildExpanded(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final userAsync = ref.watch(currentUserProvider);
    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userAsync.when(
              data: (user) => Text(
                'Hello, ${user?.name ?? 'Guest'}',
                style: text.headlineMedium?.copyWith(color: color.onPrimary),
                maxLines: 2,
                softWrap: true,
              ),
              loading: () => ShimmerText(text: 'Hello! ...'),
              error: (_, __) =>
                  Text('Hello! Guest', style: text.headlineMedium),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.onPrimary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: color.onPrimary.withValues(alpha: 0.9),
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    DateTime.now().toDisplayFullFormatDate(),
                    style: text.labelLarge?.copyWith(
                      color: color.onPrimary.withValues(alpha: 0.9),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsed(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      centerTitle: false,
      title: Text(
        'Home',
        style: text.headlineMedium?.copyWith(color: color.onPrimary),
      ),
    );
  }
}

class _SearchButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final shouldFocus = ref.read(shouldFocusSearchTextFieldProvider.notifier);
    final navigationShell = ref.read(navigationShellProvider);
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      elevation: 2,
      child: IconButton.filledTonal(
        iconSize: 30,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color.primaryContainer),
        ),
        onPressed: () {
          shouldFocus.state = true;
          navigationShell.goBranch(1);
        },
        color: color.onPrimaryContainer,
        icon: Icon(Icons.search_rounded),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const _LogoutButton({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      elevation: 2,
      child: IconButton.filledTonal(
        iconSize: 30,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color.error),
        ),
        onPressed: onLogout,
        color: color.onError,
        icon: Icon(Icons.logout),
      ),
    );
  }
}
