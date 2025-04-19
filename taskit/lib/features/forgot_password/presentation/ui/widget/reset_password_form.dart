
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../shared/presentation/widget/custom_taskit_button.dart';
import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../../controller/forgot_pass_controller.dart';

class ResetPasswordForm extends ConsumerStatefulWidget{
  const ResetPasswordForm({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ResetPasswordFormState();
}
class _ResetPasswordFormState extends ConsumerState<ResetPasswordForm>{
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmController;
  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    _listener();
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          32.0, 32.0, 32.0, 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'You\'re Verified',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontFamily: 'Inter Tight',
                letterSpacing: 0.0,
              )
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 8.0, 0.0, 16.0),
            child: Text(
                'Now, set a new password for your account',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                )
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 12.0, 0.0, 0.0),
            child: SizedBox(
                width: double.infinity,
                child: TaskitOutLineTextFieldWithPassword(
                    labelText: 'New Password',
                    controller: _passwordController
                )
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 12.0, 0.0, 0.0),
            child: SizedBox(
                width: double.infinity,
                child: TaskitOutLineTextFieldWithPassword(
                    labelText: 'Confirm New Password',
                    controller: _passwordConfirmController
                )
            ),
          ),
          Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 24.0, 0.0, 0.0),
                  child: TaskitElevationButton(onPressed: ()=>_onSummit()))
          ),
        ],
      ),
    );
  }
  void _listener(){
    ref.listen(forgotPassControllerProvider.select((value) => value.errorReset),
            (_,next){
          if (next != null) {
            _passwordController.clear();
            _passwordConfirmController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                backgroundColor: Colors.red,
                content: Text(next),
              ),
            );
          }
        });
    ref.listen(forgotPassControllerProvider.select((value)=>value.isResetSuccess),
            (_,next){
          if (next != null && next) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
                content: Text('Password reset successfully'),
              ),
            );
            context.go('/login');
          }
        });
  }
  void _onSummit(){
    final form = ({
      'password': _passwordController.text,
      'passwordConfirm': _passwordConfirmController.text
    });
    ref.read(forgotPassControllerProvider.notifier).setResetForm(form);
    ref.read(forgotPassControllerProvider.notifier).reset();
  }



}