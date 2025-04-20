import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerStatefulWidget{
  const ListPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ListPage();
}

class _ListPage extends ConsumerState<ListPage>{
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text(
        'List'
      ),
    ),
    body: Column(),
  );

}