import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/auth/controller/auth_controller.dart';
import 'custom_taskit_button.dart';

class SessionExpiredDialog extends ConsumerWidget {
  const SessionExpiredDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/image/hourglass.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Session Expired",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            "Your session has expired.\nPlease log in again to continue.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TaskitButton(
          text: 'Login',
          onPressed: () {
            ref.read(authControllerProvider.notifier).logout();
          },
        ),
      ],
    );
  }
}
