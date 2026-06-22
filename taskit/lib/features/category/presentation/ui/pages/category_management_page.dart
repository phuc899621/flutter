import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/features/category/presentation/controller/category_management_controller.dart';

import '../widgets/add_category_bottom_sheet.dart';

class CategoryManagementPage extends ConsumerStatefulWidget {
  const CategoryManagementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryManagementPageState();
}

class _CategoryManagementPageState
    extends ConsumerState<CategoryManagementPage> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(categoryManagementControllerProvider);
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: color.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCategory(context, ref),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: _buildCategoryList()),
        ),
      ),
    );
  }

  void _showAddCategory(BuildContext context, WidgetRef ref) {
    final controller = ref.read(categoryManagementControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddCategoryBottomSheet(
        title: 'Add Category',
        validator: (val) => controller.validateCategoryInput(val ?? ''),
        onConfirm: controller.addCategory,
      ),
    );
  }

  //widgets build
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Category Management'),
      actions: [],
      automaticallyImplyLeading: true,
    );
  }

  List<Widget> _buildCategoryList() {
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(categoryManagementControllerProvider);
    return [
      ...state.categories.map(
        (category) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            clipBehavior: Clip.hardEdge,
            color: color.surface,
            elevation: 1,
            borderRadius: BorderRadius.circular(15),
            child: ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!category.isDefault)
                    IconButton(
                      onPressed: () => _showOnEditDialog(category.localId),
                      icon: const Icon(Icons.edit, color: Colors.amber),
                    ),
                  if (!category.isDefault)
                    IconButton(
                      onPressed: () => _showOnDeleteDialog(category),
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                ],
              ),
              leading: Icon(Icons.category, color: Colors.orange),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: color.onSurface),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '${category.taskCount} tasks',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: color.onSurface.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 80),
    ];
  }

  //action call
  void _onAddCategory() {}

  final TextEditingController _categoryNameController = TextEditingController();
  final _editFormKey = GlobalKey<FormState>();

  Future<void> _showOnEditDialog(int localId) async {
    final state = ref.read(categoryManagementControllerProvider);
    final oldName = state.categories
        .firstWhere((element) => element.localId == localId)
        .name;
    _categoryNameController.text = oldName;
    final color = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color.surfaceDim,
          title: Text(
            'Enter new category name',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Form(
            key: _editFormKey,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (value) {
                      final inputCategory = value?.trim() ?? '';
                      return ref
                          .read(categoryManagementControllerProvider.notifier)
                          .validateCategoryInput(inputCategory);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                if (_editFormKey.currentState!.validate() &&
                    _categoryNameController.text != oldName) {
                  _onEditCategory(localId, _categoryNameController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _onEditCategory(int localId, String newName) {
    final controller = ref.read(categoryManagementControllerProvider.notifier);
    controller.editCategory(localId, newName);
  }

  void _showOnDeleteDialog(CategoryEntity category) {
    final controller = ref.read(categoryManagementControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color.surfaceDim,
          title: Text('Delete ${category.name}!'),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: color.onSurface,
            fontWeight: FontWeight.w600,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'All tasks under this category will be moved to the default category.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                controller.deleteCategory(category);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
