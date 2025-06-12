import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/app/app_color.dart';

class CategoryTabBar extends ConsumerStatefulWidget {
  final List<String> categories;
  final TabController tabController;
  const CategoryTabBar(
      {super.key, required this.categories, required this.tabController});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends ConsumerState<CategoryTabBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if (widget.tabController.indexIsChanging) {
        debugPrint('tab changed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.categories.length, (index) {
          final isSelected = widget.tabController.index == index;

          return GestureDetector(
            onTap: () {
              widget.tabController.animateTo(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColor(context).primaryContainer
                    : AppColor(context).background, // màu nền unselected
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(widget.categories[index],
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          );
        }),
      ),
    );
  }
}
