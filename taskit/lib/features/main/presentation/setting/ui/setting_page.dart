import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerStatefulWidget{
  const SettingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_SettingPageState();

}
class _SettingPageState extends ConsumerState<SettingPage>{
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: const Text(
        'Setting'
      ),
    ),
    body: const Column(),
  );

}