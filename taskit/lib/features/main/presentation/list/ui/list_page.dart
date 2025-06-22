import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app/app_color.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  Widget build(BuildContext context) {
    final color = ref.read(colorProvider(context));
    final text = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Page'),
          titleTextStyle: text.headlineSmall,
        ),
        body: SafeArea(child: SingleChildScrollView(child: Column())));
  }
}
