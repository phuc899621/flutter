import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/notification/domain/usecases/get_fcm_token_usecase.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';
import 'package:taskit/shared/widget/custom_taskit_button.dart';

final fcmTokenProvider = FutureProvider.autoDispose<Result<String?, Failure>>((
  ref,
) async {
  final useCase = ref.read(getFcmTokenUseCaseProvider);
  return useCase.call(NoParam());
});

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  Future<void> showDialogSession(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
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
              onPressed: () => ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Session expired'))),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialogSession(context);
          },
          child: Text('Show'),
        ),
      ),
    );
  }
}
