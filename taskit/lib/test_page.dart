import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/notification/domain/usecases/get_fcm_token_usecase.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';
import 'package:taskit/shared/log/logger_provider.dart';

final fcmTokenProvider = FutureProvider.autoDispose<Result<String?, Failure>>((
  ref,
) async {
  final useCase = ref.read(getFcmTokenUseCaseProvider);
  return useCase.call(NoParam());
});

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenAysunc = ref.watch(fcmTokenProvider);
    tokenAysunc.when(
      data: (token) {
        logger.d('Token: ${token.when((token) => token, (e) => e.toString())}');
      },
      error: (e, _) {},
      loading: () {},
    );

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
