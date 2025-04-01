import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskit/core/data/local/security/secure_storage.dart';

import 'isecure_storage.dart';

final secureStorageProvider=Provider<ISecureStorage>(
    (ref){
      final secureStorage=ref.watch(flutterSecureStorageProvider);
      return SecureStorage(secureStorage);
    }
);

final flutterSecureStorageProvider=Provider<FlutterSecureStorage>(
    (ref){
      const androidOptions =AndroidOptions(
        encryptedSharedPreferences: true,
      );
      const iosOptions=IOSOptions(
        accessibility: KeychainAccessibility.first_unlock
      );
      return const FlutterSecureStorage(
        aOptions: androidOptions,
        iOptions: iosOptions,
      );
    }
);