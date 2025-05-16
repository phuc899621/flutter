import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/app/app_color.dart';

class AddSubtaskWidget extends ConsumerWidget {
  final List<TextEditingController> subtaskControllers;
  final VoidCallback onAddSubtask;
  final void Function(int) onDeleteSubtask;
  const AddSubtaskWidget({
    super.key,
    required this.subtaskControllers,
    required this.onAddSubtask,
    required this.onDeleteSubtask,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: subtaskControllers.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
                height: 48,
                child: TextField(
                  controller: subtaskControllers[index],
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () => onDeleteSubtask(index),
                          icon: Icon(
                            Icons.delete,
                            color: AppColor(context).error,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor(context).onSurface, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor(context).onSurface, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      )),
                )));
      },
    );
  }
}
