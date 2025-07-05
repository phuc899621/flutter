import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryBottomSheet extends ConsumerStatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  ConsumerState<CategoryBottomSheet> createState() =>
      _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends ConsumerState<CategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          _topBar(),
        ],
      ),
    );
  }

  //region TopBar
  Widget _topBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      color: color.surfaceContainerLow,
      padding: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: context.pop,
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                color: color.onSurface,
              )),
          Text(
            'Category',
            style: text.titleLarge?.copyWith(color: color.onSurface),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
