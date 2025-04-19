import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TaskitAnimation{
  static CustomTransitionPage<SlideTransition> slidePageTransition(
      BuildContext context,
      GoRouterState state,
      ConsumerStatefulWidget page)=> CustomTransitionPage(
      child: page,
      transitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      },
    );


}