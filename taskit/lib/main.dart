import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskit/main_widget.dart';
import 'package:taskit/shared/data/source/local/storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final SharedPreferences storage = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [localStorageProvider.overrideWithValue(AsyncData(storage))],
  );
  runApp(UncontrolledProviderScope(container: container, child: MainWidget()));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background message: ${message.messageId}");
}
