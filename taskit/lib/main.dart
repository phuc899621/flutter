import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskit/main_widget.dart';
import 'package:taskit/shared/data/source/local/storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences storage = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      overrides: [localStorageProvider.overrideWithValue(AsyncData(storage))],
      child: MainWidget(),
    ),
  );
}
