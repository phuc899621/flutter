import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_button.dart';

import '../../../../../config/app/app_color.dart';

class ForgotPasswordVerifyPage extends ConsumerStatefulWidget {
  const ForgotPasswordVerifyPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordVerifyPageState();
}

class _ForgotPasswordVerifyPageState
    extends ConsumerState<ForgotPasswordVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor(context).primaryContainer,
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                width: 100.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor(context).primaryContainer,
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 46.76,
                        decoration: BoxDecoration(
                          color: AppColor(context).primaryContainer,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 32.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: AppColor(context).primaryContainer,
                              ),
                            ),
                            TaskitBackButton(onPressed: () => context.pop()),
                          ],
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ForgotPasswordVerifyPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
