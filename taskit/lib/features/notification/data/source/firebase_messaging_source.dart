import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseMessagingDataSourceProvider =
    Provider<FirebaseMessagingDataSource>(
      (ref) => FirebaseMessagingDataSource(),
    );

class FirebaseMessagingDataSource {
  Stream<String> onTokenRefresh() => FirebaseMessaging.instance.onTokenRefresh;

  Future<String?> getToken() => FirebaseMessaging.instance.getToken();

  Future<NotificationSettings> requestPermission() =>
      FirebaseMessaging.instance.requestPermission(provisional: true);
}
